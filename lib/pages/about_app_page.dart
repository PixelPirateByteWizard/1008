import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于 Securoli'),
        elevation: 0,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const SizedBox(height: 20),
        _buildLogo(),
        const SizedBox(height: 20),
        _buildAppInfo(),
        const SizedBox(height: 30),
        _buildDescription(),
        const SizedBox(height: 30),
        _buildFeatures(),
        const SizedBox(height: 30),
        _buildDeveloperInfo(),
      ],
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Colors.blue,
      child: Icon(Icons.security, size: 60, color: Colors.white),
    );
  }

  Widget _buildAppInfo() {
    return const Column(
      children: [
        Text(
          'Securoli',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '版本 1.0.0', // 硬编码版本号
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Securoli 是您的个人安全助手，提供加密、密码管理和二维码生成等功能，'
          '帮助您在数字世界中保护隐私和提高安全性。',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildFeatures() {
    final features = [
      '强大的加密工具',
      '安全的密码管理器',
      '便捷的二维码生成器',
      '用户友好的界面',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '主要功能',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Expanded(child: Text(feature)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperInfo() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '开发者信息',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('开发者: Your Name'),
            Text('联系邮箱: your.email@example.com'),
            Text('官方网站: https://www.securoli.com'),
          ],
        ),
      ),
    );
  }
}