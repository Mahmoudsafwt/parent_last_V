import 'package:grad_project_last_v/screens/login_screen.dart';
import'package:shared_preferences/shared_preferences.dart';
class SetAndGetToken{
  static Future<void>saveToken(String token)async {
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  static Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

}