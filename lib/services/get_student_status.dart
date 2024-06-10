import 'dart:convert';

import 'package:grad_project_last_v/screens/list_all_students.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';


import 'package:http/http.dart' as http;



class GetStudentStatus {
  // Method now returns a Future<String> representing the status
  static Future<String> getStatus(int id, String token) async {
    Uri url = Uri.parse('https://gp-saveurkid.up.railway.app/api/getStatus/$id');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // Return the student status or 'Not Found' if the data is null
      return jsonResponse['data'] != null ? jsonResponse['data']['Student_Status'] : 'Not Found';
    } else {
      throw Exception('Failed to load student status');
    }
  }
}


// class GetStudentStatus {
//
//   static Future<Map<String,dynamic>>getStatus(int id,String token) async {
//     Uri url =Uri.parse('https://gp-saveurkid.up.railway.app/api/getStatus/$id');
//     var response=await http.get(url,headers: {
//       'Authorization': 'Bearer $token'
//     });
//     if(response.statusCode==200){
//       Map<String,dynamic> responseData=jsonDecode(response.body);
//       print(responseData);
//       return responseData;
//
//
//     }
//     else{
//       throw Exception('Failed to get status: ${response.statusCode}');
//     }
//   }
// }
