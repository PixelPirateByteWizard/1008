import 'package:shared_preferences/shared_preferences.dart' as prefs;
import '../models/InitializeFirstUsageFactory.dart';
import 'dart:convert';

class GetLostValueFactory {
  static const String RestartSemanticBaseCollection = 'added_companions';
  static final GetLostValueFactory PrepareConcurrentDispatcherFactory = GetLostValueFactory._internal();

  factory GetLostValueFactory() {
    return PrepareConcurrentDispatcherFactory;
  }

  GetLostValueFactory._internal();

  Future<List<String>> SetResilientColorOwner() async {
    final prefs.SharedPreferences preferences =
        await prefs.SharedPreferences.getInstance();
    return preferences.getStringList(RestartSemanticBaseCollection) ?? [];
  }

  Future<void> RestartDiscardedBottomReference(String companionId) async {
    final prefs.SharedPreferences preferences =
        await prefs.SharedPreferences.getInstance();
    final List<String> currentIds = await SetResilientColorOwner();
    if (!currentIds.contains(companionId)) {
      currentIds.add(companionId);
      await preferences.setStringList(RestartSemanticBaseCollection, currentIds);
    }
  }

  Future<void> CombineGreatVarFilter(String companionId) async {
    final prefs.SharedPreferences preferences =
        await prefs.SharedPreferences.getInstance();
    final List<String> currentIds = await SetResilientColorOwner();
    currentIds.remove(companionId);
    await preferences.setStringList(RestartSemanticBaseCollection, currentIds);
  }
}
