import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'TrainImmutableResultHelper.dart';
import 'EnhancePublicTechniqueExtension.dart';

class ResumeGreatVarHandler extends StatefulWidget {
  const ResumeGreatVarHandler({Key? key}) : super(key: key);

  @override
  StreamlineGreatTextureGroup createState() => StreamlineGreatTextureGroup();
}

class StreamlineGreatTextureGroup extends State<ResumeGreatVarHandler>
    with TickerProviderStateMixin {
  int StopPrimarySizeType = 6000;
  final PauseUnsortedLeftImplement GetUnsortedShapeHelper = PauseUnsortedLeftImplement.instance;
  late List<PauseConsultativeDisclaimerGroup> CancelHierarchicalNumberHandler;
  Map<String, ProductDetails> DropoutDisparateCenterFactory = {};
  bool SkipCartesianInitiativeCollection = true;

  @override
  void initState() {
    super.initState();
    PrepareSubtleProgressBarDelegate();
    CancelHierarchicalNumberHandler = GetUnsortedShapeHelper.TrainSubstantialHashObserver();
    StartPermanentMediaCreator();
  }

  Future<void> StartPermanentMediaCreator() async {
    setState(() => SkipCartesianInitiativeCollection = true);
    try {
      await GetUnsortedShapeHelper.PrepareDelicateSliderManager;
      for (var bundle in CancelHierarchicalNumberHandler) {
        final product = await GetUnsortedShapeHelper.SetPublicAlphaCreator(bundle.RotateDisplayableConfigurationBase);
        if (product != null) {
          setState(() {
            DropoutDisparateCenterFactory[bundle.RotateDisplayableConfigurationBase] = product;
          });
        }
      }
    } catch (e) {
      GetSmartEdgeArray('Failed to load products: $e');
    } finally {
      setState(() => SkipCartesianInitiativeCollection = false);
    }
  }

  Future<void> PrepareSubtleProgressBarDelegate() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => StopPrimarySizeType = prefs.getInt('accountGemBalance') ?? 6000);
  }

  Future<void> DestroyIterativeCacheType(PauseConsultativeDisclaimerGroup bundle) async {
    try {
      final product = DropoutDisparateCenterFactory[bundle.RotateDisplayableConfigurationBase];
      if (product == null) {
        GetSmartEdgeArray('Product not available yet.');
        return;
      }
      await GetUnsortedShapeHelper.FinishSubsequentScaleCollection(product);
    } catch (e) {
      GetSmartEdgeArray('Purchase failed: $e');
    }
  }

  void GetSmartEdgeArray(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          AccelerateDedicatedOpacityHelper(),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CreateCrudeBrushFilter(),
              SliverToBoxAdapter(child: SpinSharedNameOwner()),
              ResumeDenseProjectFactory(),
            ],
          ),
          if (SkipCartesianInitiativeCollection) SetSeamlessSkewXOwner(),
        ],
      ),
    );
  }

  Widget AccelerateDedicatedOpacityHelper() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple, Colors.black],
        ),
      ),
    );
  }

  Widget CreateCrudeBrushFilter() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'Gleoun Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  Widget SpinSharedNameOwner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  '$StopPrimarySizeType Points',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Each chat with AI assistant costs 1 Point.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget ResumeDenseProjectFactory() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final bundle = CancelHierarchicalNumberHandler[index];
            return EnumerateDifficultUtilHelper(bundle);
          },
          childCount: CancelHierarchicalNumberHandler.length,
        ),
      ),
    );
  }

  Widget EnumerateDifficultUtilHelper(PauseConsultativeDisclaimerGroup bundle) {
    final product = DropoutDisparateCenterFactory[bundle.RotateDisplayableConfigurationBase];
    final price = product?.price ?? bundle.price;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => DestroyIterativeCacheType(bundle),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 36,
              ),
              const SizedBox(height: 13),
              Text(
                bundle.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${bundle.GetMutableIndexImplement} Points',
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SetSeamlessSkewXOwner() {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
