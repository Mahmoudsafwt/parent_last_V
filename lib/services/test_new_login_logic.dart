import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginServiceAfterTesting {
  static late Map<String, dynamic> parentData;
  static Future<bool> login(
      {required String email, required String password}) async {
    Uri url = Uri.parse(
        'https://gp-saveurkid.up.railway.app/api/Parentlogin?Email=$email&Password=$password');
    final response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      parentData = responseData;

      return true;
    } else {
      print(response.statusCode);
      return false;

    }
  }

  static void clearParentData() {
    parentData.clear();
  }
}
