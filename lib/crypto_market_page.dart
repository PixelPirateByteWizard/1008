import 'package:flutter/material.dart';

class CryptoMarketPage extends StatelessWidget {
  const CryptoMarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CryptoMarketView();
  }
}

class CryptoMarketView extends StatefulWidget {
  const CryptoMarketView({Key? key}) : super(key: key);

  @override
  _CryptoMarketViewState createState() => _CryptoMarketViewState();
}

class _CryptoMarketViewState extends State<CryptoMarketView> {
  final List<ExchangeData> exchangeData = [
    ExchangeData(
      name: '火幣全球站',
      pairCount: '576個',
      volume: '418.02億',
      usdVolume: '\$58.98億',
      rating: 9,
      icon: Icons.local_fire_department,
    ),
    ExchangeData(
      name: '幣安網',
      pairCount: '608個',
      volume: '296.21億',
      usdVolume: '\$41.8億',
      rating: 9,
      icon: Icons.diamond,
    ),
    ExchangeData(
      name: 'OKEx',
      pairCount: '512個',
      volume: '215.36億',
      usdVolume: '\$30.39億',
      rating: 8,
      icon: Icons.circle,
    ),
    ExchangeData(
      name: 'Bitfinex',
      pairCount: '342個',
      volume: '189.75億',
      usdVolume: '\$26.77億',
      rating: 8,
      icon: Icons.attach_money,
    ),
    ExchangeData(
      name: 'Coinbase Pro',
      pairCount: '284個',
      volume: '156.42億',
      usdVolume: '\$22.07億',
      rating: 7,
      icon: Icons.account_balance,
    ),
    ExchangeData(
      name: 'Kraken',
      pairCount: '420個',
      volume: '132.58億',
      usdVolume: '\$18.71億',
      rating: 7,
      icon: Icons.water,
    ),
    ExchangeData(
      name: 'Bittrex',
      pairCount: '380個',
      volume: '98.63億',
      usdVolume: '\$13.92億',
      rating: 6,
      icon: Icons.trending_up,
    ),
    ExchangeData(
      name: 'Gemini',
      pairCount: '210個',
      volume: '76.45億',
      usdVolume: '\$10.79億',
      rating: 6,
      icon: Icons.star,
    ),
    ExchangeData(
      name: 'KuCoin',
      pairCount: '450個',
      volume: '112.34億',
      usdVolume: '\$15.85億',
      rating: 7,
      icon: Icons.currency_exchange,
    ),
  ];

  late List<ExchangeData> filteredExchangeData;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredExchangeData = exchangeData;
  }

  void filterExchanges(String query) {
    setState(() {
      filteredExchangeData = exchangeData
          .where((exchange) =>
              exchange.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(
            child: ListView.separated(
              itemCount: filteredExchangeData.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: Colors.grey),
              itemBuilder: (context, index) {
                final exchange = filteredExchangeData[index];
                return ExchangeListItem(
                  exchange: exchange,
                  rank: '${index + 1}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: isSearching
          ? TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: '搜索交易所...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: filterExchanges,
            )
          : const Text('ER全球交易所排行', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue[800],
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: Icon(isSearching ? Icons.close : Icons.search, color: Colors.white),
          onPressed: _toggleSearch,
        ),
      ],
    );
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear();
        filterExchanges('');
      }
    });
  }

  Widget _buildFilterBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      color: Colors.blue[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('平台/交易對數量',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Row(
            children: [
              Text('24H額(¥) ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Icon(Icons.arrow_downward, size: 14, color: Colors.white),
            ],
          ),
          Text('ExRank',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

class ExchangeData {
  final String name;
  final String pairCount;
  final String volume;
  final String usdVolume;
  final int rating;
  final IconData icon;

  const ExchangeData({
    required this.name,
    required this.pairCount,
    required this.volume,
    required this.usdVolume,
    required this.rating,
    required this.icon,
  });
}

class ExchangeListItem extends StatelessWidget {
  final ExchangeData exchange;
  final String rank;

  const ExchangeListItem({
    Key? key,
    required this.exchange,
    required this.rank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              rank,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            radius: 22,
            child: Icon(exchange.icon, size: 26, color: Colors.blue[800]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exchange.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(exchange.pairCount,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(exchange.volume,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(exchange.usdVolume,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              exchange.rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}