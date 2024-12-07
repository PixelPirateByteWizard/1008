import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shopping_item.dart';
import '../models/pet.dart';
import '../models/task.dart';

class StorageService {
  static const String _shoppingListKey = 'shopping_list';
  static const String _petsKey = 'pets';
  static const String _tasksKey = 'tasks';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  // Shopping List Methods
  Future<List<Map<String, dynamic>>> getShoppingList() async {
    final String? jsonString = _prefs.getString(_shoppingListKey);
    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.cast<Map<String, dynamic>>();
  }

  Future<void> saveShoppingList(List<Map<String, dynamic>> items) async {
    await _prefs.setString(_shoppingListKey, jsonEncode(items));
  }

  // Pets Methods
  Future<List<Map<String, dynamic>>> getPets() async {
    final String? jsonString = _prefs.getString(_petsKey);
    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.cast<Map<String, dynamic>>();
  }

  Future<void> savePets(List<Map<String, dynamic>> pets) async {
    await _prefs.setString(_petsKey, jsonEncode(pets));
  }

  // Tasks Methods
  Future<List<Map<String, dynamic>>> getTasks() async {
    final String? jsonString = _prefs.getString(_tasksKey);
    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.cast<Map<String, dynamic>>();
  }

  Future<void> saveTasks(List<Map<String, dynamic>> tasks) async {
    await _prefs.setString(_tasksKey, jsonEncode(tasks));
  }
}
