import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/friend.dart';

class FriendsService {
  static const String _key = 'friends';

  static Future<List<Friend>> getFriends() async {
    final prefs = await SharedPreferences.getInstance();
    final String? friendsJson = prefs.getString(_key);
    if (friendsJson == null) return [];

    final List<dynamic> decoded = jsonDecode(friendsJson);
    return decoded.map((item) => Friend.fromJson(item)).toList();
  }

  static Future<bool> addFriend(Friend friend) async {
    final friends = await getFriends();
    if (!friends.any((f) => f.id == friend.id)) {
      friends.add(friend);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          _key, jsonEncode(friends.map((f) => f.toJson()).toList()));
      return true; // 添加成功
    }
    return false; // 已经是好友
  }

  static Future<void> removeFriend(String id) async {
    final friends = await getFriends();
    friends.removeWhere((f) => f.id == id);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode(friends.map((f) => f.toJson()).toList()));
  }

  static Future<bool> isFriend(String id) async {
    final friends = await getFriends();
    return friends.any((f) => f.id == id);
  }
}
