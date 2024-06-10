import 'dart:convert';

import 'package:grad_project_last_v/screens/splash_screen.dart';
import 'package:http/http.dart' as http;
class GetStudentInfo{

  static Future<void> getStudentInformation(String token ,int id) async {
    try {
      final response = await http.post(
        Uri.parse('https://gp-saveurkid.up.railway.app/api/getParentChild?id=$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        final jsonData=jsonDecode(response.body);
       studentList=jsonData['data'];
        print('get info successfully ');

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