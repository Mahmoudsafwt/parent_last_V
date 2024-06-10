
import 'package:grad_project_last_v/screens/splash_screen.dart';
import 'package:grad_project_last_v/services/test_new_login_logic.dart';
import 'package:http/http.dart' as http;
class LogoutService{
  static Future<void> logout(String token) async {
    try {
      final response = await http.post(
        Uri.parse('https://gp-saveurkid.up.railway.app/api/Flogout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        LoginServiceAfterTesting.clearParentData();
        studentList.clear();
        print('successfully logout');

      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to logout: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any errors that occur during the API call
      print('Error during logout: $e');
      rethrow; // Rethrow the caught exception


    }
  }
}
