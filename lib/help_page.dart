import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('使用帮助'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              '常见问题',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildExpansionTile(
                  '如何查看加密货币行情?',
                  '在主页面上,您可以看到加密货币的列表。点击任何一个货币可以查看详细信息,包括价格走势图、交易量和市值等数据。',
                  Icons.show_chart,
                ),
                _buildExpansionTile(
                  '如何刷新行情数据?',
                  '在主页面上,下拉列表可以刷新最新的行情数据。我们的数据每5分钟自动更新一次,确保您能看到最新的市场动态。',
                  Icons.refresh,
                ),
                _buildExpansionTile(
                  '如何创建自定义投资组合?',
                  '在"我的投资"页面,点击"添加"按钮,然后选择您感兴趣的加密货币并输入持有数量。系统会自动计算您的投资组合价值和收益情况。',
                  Icons.account_balance_wallet,
                ),
                _buildExpansionTile(
                  '如何设置价格提醒?',
                  '在任何加密货币的详情页面,点击"设置提醒"按钮。您可以设置价格上涨或下跌到特定水平时接收通知。',
                  Icons.notifications_active,
                ),
                _buildExpansionTile(
                  '如何阅读和理解价格图表?',
                  '价格图表显示了加密货币的历史价格走势。您可以选择不同的时间范围(如1天、1周、1月等)来查看。图表上的绿色表示价格上涨,红色表示下跌。',
                  Icons.insert_chart,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
