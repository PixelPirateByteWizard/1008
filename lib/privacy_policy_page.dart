import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('隐私协议'),
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
                '隐私协议',
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
                  _buildSection('1. 信息收集', [
                    '我们收集的信息可能包括:',
                    '• 个人识别信息(如电子邮件地址)',
                    '• 设备信息(如设备型号、操作系统版本)',
                    '• 使用数据(如应用使用频率、访问的页面)',
                  ]),
                  _buildSection('2. 信息使用', [
                    '我们使用收集的信息来:',
                    '• 提供、维护和改进我们的服务',
                    '• 发送通知和更新',
                    '• 响应您的请求和提供客户支持',
                    '• 分析使用模式以改进用户体验',
                  ]),
                  _buildSection('3. 信息共享', [
                    '我们不会出售或出租您的个人信息。',
                    '在以下情况下,我们可能会共享您的信息:',
                    '• 经您同意',
                    '• 遵守法律要求',
                    '• 保护我们的权利和财产',
                  ]),
                  _buildSection('4. 数据安全', [
                    '我们采取合理的安全措施来保护您的信息免受未经授权的访问、使用或披露。',
                  ]),
                  _buildSection('5. 您的权利', [
                    '您有权:',
                    '• 访问、更正或删除您的个人信息',
                    '• 限制或反对我们处理您的信息',
                    '• 随时撤回同意',
                  ]),
                  _buildSection('6. 隐私政策的变更', [
                    '我们可能会不时更新本隐私政策。更新后的版本将在本页面上发布。',
                  ]),
                  const SizedBox(height: 24),
                  const Text(
                    '最后更新日期: 2023年5月1日',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
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
