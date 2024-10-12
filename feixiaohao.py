from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from bs4 import BeautifulSoup
import json

def fetch_news():
    url = "https://www.feixiaohao.com/news?tab=1"
    
    # 设置Chrome选项
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # 无头模式
    
    # 使用 webdriver_manager 来管理 ChromeDriver
    service = Service(ChromeDriverManager().install())
    
    # 创建 WebDriver 实例
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        driver.get(url)
        
        # 等待新闻内容加载
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "news_list_box"))
        )
        
        # 获取渲染后的HTML
        html_content = driver.page_source
        
        soup = BeautifulSoup(html_content, 'html.parser')
        
        news_items = []
        articles = soup.select('.news_list_box .art_list')
        print(f"找到的新闻项数量: {len(articles)}")
        
        for article in articles:
            title = article.select_one('.tit')
            content = article.select_one('.preview')
            time_element = article.select_one('.time span:last-child')
            
            if title and content:
                title_text = title.text.strip()
                content_text = content.text.strip()
                time_text = time_element.text.strip() if time_element else "未知时间"
                
                print(f"标题: {title_text}")
                print(f"内容: {content_text}")
                print(f"时间: {time_text}")
                
                news_items.append({
                    'title': title_text,
                    'content': content_text,
                    'time': time_text,
                })
        
        # 保存为JSON文件
        with open('news_data.json', 'w', encoding='utf-8') as f:
            json.dump(news_items, f, ensure_ascii=False, indent=4)
        
        print(f"保存了 {len(news_items)} 条新闻")
    
    finally:
        driver.quit()

if __name__ == "__main__":
    fetch_news()
    print("新闻数据已保存到 news_data.json 文件中")
