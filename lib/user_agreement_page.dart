import 'package:flutter/material.dart';

class UserAgreementPage extends StatelessWidget {
  const UserAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户协议'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: const Text(
                '用户协议',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection('1. 服务条款', [
                    '欢迎使用我们的加密货币行情App。使用本应用即表示您同意遵守以下条款和条件。',
                    '我们保留随时修改这些条款的权利,修改后的条款将在本页面上发布。',
                  ]),
                  _buildSection('2. 使用规则', [
                    '您同意不会使用本应用从事任何非法或未经授权的活动。',
                    '您不得干扰或破坏本应用的正常运行。',
                  ]),
                  _buildSection('3. 知识产权', [
                    '本应用的所有内容,包括但不限于文本、图形、标志、按钮图标、图像和软件,均为我们或我们的内容提供商所有。',
                    '未经我们明确书面许可,您不得复制、修改、创建衍生作品、公开展示、表演、重新发布、下载、存储或传输本应用的任何内容。',
                  ]),
                  _buildSection('4. 免责声明', [
                    '本应用提供的所有信息仅供参考,不构成任何投资建议。',
                    '我们不对因使用或无法使用本应用而导致的任何损失承担责任。',
                  ]),
                  _buildSection('5. 隐私政策', [
                    '我们重视您的隐私。有关我们如何收集、使用和保护您的个人信息,请参阅我们的隐私政策。',
                  ]),
                  const SizedBox(height: 24),
                  const Text(
                    '最后更新日期: 2023年5月1日',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> contents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...contents.map((content) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(content, style: const TextStyle(fontSize: 16)),
            )),
        const SizedBox(height: 16),
      ],
    );
  }
}
