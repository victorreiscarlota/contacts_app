import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic>? _user;
  
  Map<String, dynamic>? get user => _user;

  static const _prefsKey = 'userData';

  UserProvider() {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_prefsKey);
    
    if (userData != null) {
      _user = Map<String, dynamic>.from(json.decode(userData));
      notifyListeners();
    }
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsKey, json.encode(_user));
  }

  void updateProfile({
    String? name,
    String? imageUrl,
  }) {
    if (_user != null) {
      _user!['name'] = name ?? _user!['name'];
      _user!['imageUrl'] = imageUrl ?? _user!['imageUrl'];
      _saveUserData();
      notifyListeners();
    }
  }

  void setUser({
    required String name,
    required String email,
    required String phone,
    required String imageUrl,
  }) {
    _user = {
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
    };
    _saveUserData();
    notifyListeners();
  }
}