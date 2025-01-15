import 'package:shared_preferences/shared_preferences.dart';

class PauseResilientDescriptionOwner {
  static const String PushDirectRightCollection = 'accountGemBalance';
  static const int GetActivatedAssetManager = 5000;

  static Future<int> InitializeAutoVarProtocol() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(PushDirectRightCollection) ?? GetActivatedAssetManager;
  }

  static Future<void> SetPrimaryAssetInstance(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(PushDirectRightCollection, amount);
  }

  static Future<void> SetNumericalTaxonomyHandler(int amount) async {
    int currentBalance = await InitializeAutoVarProtocol();
    int newBalance =
        (currentBalance - amount).clamp(0, double.infinity).toInt();
    await SetPrimaryAssetInstance(newBalance);
  }

  static Future<void> SetIterativeOriginFilter(int amount) async {
    int currentBalance = await InitializeAutoVarProtocol();
    await SetPrimaryAssetInstance(currentBalance + amount);
  }
}
