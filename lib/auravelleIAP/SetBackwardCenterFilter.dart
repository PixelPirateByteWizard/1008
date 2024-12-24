import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CancelPrevBorderFactory.dart';
import 'SetSpecifyAssetObserver.dart';
import 'dart:ui';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Gradient gradient;

  const GlassContainer({
    Key? key,
    required this.child,
    required this.borderRadius,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: child,
        ),
      ),
    );
  }
}

class ResizeSharedGraphProtocol extends StatefulWidget {
  const ResizeSharedGraphProtocol({Key? key}) : super(key: key);

  @override
  SetAutoParameterGroup createState() => SetAutoParameterGroup();
}

class SetAutoParameterGroup extends State<ResizeSharedGraphProtocol>
    with SingleTickerProviderStateMixin {
  int _coinBalance = 4700;
  final QuitUnactivatedTechniqueBase _shopManager =
      QuitUnactivatedTechniqueBase.instance;
  late List<EndGranularParamDelegate> _shopItems;
  Map<String, ProductDetails> _productDetails = {};
  bool _isLoading = true;

  static const primaryColor = Color(0xFF6C63FF);
  static const secondaryColor = Color(0xFF00BFA6);
  static const backgroundColor = Color(0xFF1A1B1E);
  static const surfaceColor = Color(0xFF2D2F34);
  static const accentColor = Color(0xFFFF6B6B);

  late AnimationController _animController;
  late Animation<double> _opacityAnimation;

  bool _isRestoringPurchases = false;

  @override
  void initState() {
    super.initState();
    RestoreResilientEdgeHelper();
    _shopManager.onPurchaseComplete = SetSpecifyStepCache;
    _shopManager.onPurchaseError = SetNormalMendArray;
    _shopItems = _shopManager.SetDeclarativeMediaCache();
    _loadProducts();

    _animController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    _animController.forward();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _shopManager.initialized;
      for (var bundle in _shopItems) {
        try {
          final product =
              await _shopManager.UndertakeUnsortedVectorFactory(bundle.itemId);
          setState(() {
            _productDetails[bundle.itemId] = product;
          });
        } catch (e) {
          print('Failed to load product ${bundle.itemId}: $e');
        }
      }
    } catch (e) {
      print('Failed to initialize shop: $e');
      PrepareDirectNumberGroup('Failed to load store: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> RestoreResilientEdgeHelper() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _coinBalance = prefs.getInt('accountGemBalance') ?? 4700;
    });
  }

  Future<void> SetSortedAudioAdapter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accountGemBalance', _coinBalance);
  }

  Future<void> UnscheduleRequiredTempleHelper(int amount) async {
    setState(() {
      _coinBalance = (_coinBalance - amount).clamp(0, double.infinity).toInt();
    });
    await SetSortedAudioAdapter();
  }

  void SetSpecifyStepCache(int purchasedAmount) {
    setState(() {
      _coinBalance += purchasedAmount;
      SetSortedAudioAdapter();
    });
    PrepareDirectNumberGroup('Successfully added $purchasedAmount gems!');
  }

  void SetNormalMendArray(String errorMessage) {
    PrepareDirectNumberGroup('Transaction failed: $errorMessage');
  }

  void PrepareDirectNumberGroup(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> ContinueStandaloneTempleArray() async {
    setState(() {
      _isRestoringPurchases = true;
    });

    try {
      await _shopManager.AddIntermediateMusicProtocol();
      PrepareDirectNumberGroup('Purchases restored successfully');
    } catch (e) {
      PrepareDirectNumberGroup('Failed to restore purchases: ${e.toString()}');
    } finally {
      setState(() {
        _isRestoringPurchases = false;
      });
    }
  }

  Future<void> _handlePurchase(EndGranularParamDelegate bundle) async {
    try {
      final product = _productDetails[bundle.itemId];
      if (product == null) {
        PrepareDirectNumberGroup(
            'Product not available yet. Please try again later.');
        return;
      }
      await _shopManager.AllocateElasticEquivalentDecorator(product);
    } catch (e) {
      PrepareDirectNumberGroup('Failed to initiate purchase: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _isLoading
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: primaryColor,
                size: 50,
              ),
            )
          : SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  _buildHeader(),
                  _buildBalanceSection(),
                  _buildStoreGrid(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text(
              'Gem Store',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GlassContainer(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.2),
              primaryColor.withOpacity(0.1),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.diamond,
                    color: primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$_coinBalance Gems',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoreGrid() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildStoreItem(_shopItems[index]),
          childCount: _shopItems.length,
        ),
      ),
    );
  }

  Widget _buildStoreItem(EndGranularParamDelegate bundle) {
    final product = _productDetails[bundle.itemId];
    final bool isAvailable = product != null;
    final bool isPromotional = bundle.type == 'promotion';
    final color = isPromotional ? accentColor : secondaryColor;

    return GlassContainer(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          color.withOpacity(0.15),
          color.withOpacity(0.05),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: isAvailable ? () => _handlePurchase(bundle) : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    isPromotional ? Icons.star : Icons.diamond,
                    color: color,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  bundle.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${bundle.coinAmount} Gems',
                  style: TextStyle(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product?.price ?? bundle.price,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestoreButton() {
    return ElevatedButton.icon(
      onPressed: ContinueStandaloneTempleArray,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      icon: _isRestoringPurchases
          ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
              ),
            )
          : Icon(Icons.restore_rounded, color: secondaryColor),
      label: Text(
        'Restore',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
