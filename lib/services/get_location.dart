import 'dart:convert';

import 'package:http/http.dart' as http;
 Map<String,dynamic>location={};
class GetLocation{

  static Future<void> getStudentLocation(String token ,int studentID) async {
    try {
      final response = await http.get(
        Uri.parse('https://gp-saveurkid.up.railway.app/api/getStLoctaion/$studentID'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Successful logout
        final jsonData=jsonDecode(response.body);
        String locationResponse = jsonData["data"];
        List<String> coordinates = locationResponse.split(",");
        double latitude = double.parse(coordinates[0]);


        double longitude = double.parse(coordinates[1]);
        location["latitude"] = latitude;
        location["longitude"] = longitude;

        print(location);

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