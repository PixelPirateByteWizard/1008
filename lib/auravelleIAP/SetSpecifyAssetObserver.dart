class EndGranularParamDelegate {
  final String itemId;
  final String name;
  final String type;
  final int coinAmount;
  final String price;
  final String description;
  final String locale;
  final String category;

  const EndGranularParamDelegate({
    required this.itemId,
    required this.name,
    required this.type,
    required this.coinAmount,
    required this.price,
    required this.description,
    required this.locale,
    required this.category,
  });
}

const List<EndGranularParamDelegate> shopInventory = <EndGranularParamDelegate>[
  // Regular Items
  EndGranularParamDelegate(
    itemId: '494000',
    name: '100 Coins',
    type: 'basic',
    coinAmount: 100,
    price: '0.99',
    description: '100 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  EndGranularParamDelegate(
    itemId: '494001',
    name: '500 Coins',
    type: 'basic',
    coinAmount: 500,
    price: '4.99',
    description: '500 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  EndGranularParamDelegate(
    itemId: '494002',
    name: '1200 Coins',
    type: 'basic',
    coinAmount: 1200,
    price: '9.99',
    description: '1200 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  EndGranularParamDelegate(
    itemId: '494003',
    name: '2500 Coins',
    type: 'basic',
    coinAmount: 2500,
    price: '19.99',
    description: '2500 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  EndGranularParamDelegate(
    itemId: '494004',
    name: '7000 Coins',
    type: 'basic',
    coinAmount: 7000,
    price: '49.99',
    description: '7000 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  EndGranularParamDelegate(
    itemId: '494005',
    name: '15000 Coins',
    type: 'basic',
    coinAmount: 15000,
    price: '99.99',
    description: '15000 Virtual Coins',
    locale: 'en_US',
    category: 'basic',
  ),
  // Promotional Items
  EndGranularParamDelegate(
    itemId: '494006',
    name: '500 Coins (Special)',
    type: 'promotion',
    coinAmount: 500,
    price: '1.99',
    description: '500 Virtual Coins (Special Offer)',
    locale: 'en_US',
    category: 'promotion',
  ),
  EndGranularParamDelegate(
    itemId: '494007',
    name: '1200 Coins (Special)',
    type: 'promotion',
    coinAmount: 1200,
    price: '4.99',
    description: '1200 Virtual Coins (Special Offer)',
    locale: 'en_US',
    category: 'promotion',
  ),
  EndGranularParamDelegate(
    itemId: '494008',
    name: '2500 Coins (Special)',
    type: 'promotion',
    coinAmount: 2500,
    price: '11.99',
    description: '2500 Virtual Coins (Special Offer)',
    locale: 'en_US',
    category: 'promotion',
  ),
  EndGranularParamDelegate(
    itemId: '494009',
    name: '7000 Coins (Special)',
    type: 'promotion',
    coinAmount: 7000,
    price: '34.99',
    description: '7000 Virtual Coins (Special Offer)',
    locale: 'en_US',
    category: 'promotion',
  ),
  EndGranularParamDelegate(
    itemId: '494010',
    name: '15000 Coins (Special)',
    type: 'promotion',
    coinAmount: 15000,
    price: '79.99',
    description: '15000 Virtual Coins (Special Offer)',
    locale: 'en_US',
    category: 'promotion',
  ),
];
