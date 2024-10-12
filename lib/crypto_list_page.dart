import 'package:flutter/material.dart';

class CryptoListPage extends StatelessWidget {
  const CryptoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('加密货币行情', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  final crypto = cryptoList[index];
                  return CryptoListTile(crypto: crypto, index: index);
                },
                physics: AlwaysScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Crypto {
  final String name;
  final String symbol;
  final double price;
  final double changePercentage;

  Crypto({
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
  });
}

final List<Crypto> cryptoList = [
  Crypto(name: '比特币', symbol: 'BTC', price: 125000.0, changePercentage: 2.1),
  Crypto(name: '以太坊', symbol: 'ETH', price: 8500.0, changePercentage: 1.8),
  Crypto(name: '莱特币', symbol: 'LTC', price: 220.0, changePercentage: -0.5),
  Crypto(name: '瑞波币', symbol: 'XRP', price: 2.5, changePercentage: 3.2),
  Crypto(name: '狗狗币', symbol: 'DOGE', price: 0.25, changePercentage: 5.5),
  Crypto(name: '币安币', symbol: 'BNB', price: 750.0, changePercentage: 0.7),
  Crypto(name: '卡尔达诺', symbol: 'ADA', price: 3.5, changePercentage: 2.8),
  Crypto(name: '波卡', symbol: 'DOT', price: 65.0, changePercentage: 1.2),
  Crypto(name: '索拉纳', symbol: 'SOL', price: 280.0, changePercentage: 4.3),
  Crypto(name: '柚子', symbol: 'EOS', price: 8.2, changePercentage: -1.5),
  Crypto(name: '链接', symbol: 'LINK', price: 55.0, changePercentage: 3.1),
  Crypto(name: '波场', symbol: 'TRX', price: 0.45, changePercentage: 1.9),
  Crypto(name: '星云链', symbol: 'NEO', price: 110.0, changePercentage: -0.8),
  Crypto(name: '门罗币', symbol: 'XMR', price: 450.0, changePercentage: 2.2),
  Crypto(name: '达世币', symbol: 'DASH', price: 250.0, changePercentage: -0.3),
];

class CryptoListTile extends StatelessWidget {
  final Crypto crypto;
  final int index;

  const CryptoListTile({super.key, required this.crypto, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(width: 12),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Center(
                child: Text(
                  crypto.symbol[0],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crypto.symbol,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    crypto.name,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '¥${crypto.price.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  '${crypto.changePercentage >= 0 ? '+' : ''}${crypto.changePercentage.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: crypto.changePercentage >= 0
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
