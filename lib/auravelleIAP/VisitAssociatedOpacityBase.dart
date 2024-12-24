import 'package:shared_preferences/shared_preferences.dart';

class EndRequiredButtonCollection {
  static const String _balanceKey = 'accountGemBalance';
  static const int _initialBalance = 5000;

  static Future<int> ProvideActivatedLeftManager() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_balanceKey) ?? _initialBalance;
  }

  static Future<void> SetDisparateScaleFactory(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_balanceKey, amount);
  }

  static Future<void> CancelBackwardHeadBase(int amount) async {
    int currentBalance = await ProvideActivatedLeftManager();
    int newBalance =
        (currentBalance - amount).clamp(0, double.infinity).toInt();
    await SetDisparateScaleFactory(newBalance);
  }

  static Future<void> StopDedicatedLatencyInstance(int amount) async {
    int currentBalance = await ProvideActivatedLeftManager();
    await SetDisparateScaleFactory(currentBalance + amount);
  }
}
