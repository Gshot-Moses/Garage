import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferencesAsync preferences;

  LocalStorage({required this.preferences});

  Future<void> storeUserInfo(String json) async {
    await preferences.setString("user_info", json);
  }

  Future<String?> getUserInfo() async {
    return preferences.getString("user_info");
  }

  Future<void> saveAccessToken(String accessToken) async {
    await preferences.setString("access_token", accessToken);
  }

  Future<String?> getAccessToken() async {
    return await preferences.getString("access_token");
  }
}