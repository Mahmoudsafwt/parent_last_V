// class WeatherModel {
//   String date;
//   double temp;
//   double maxTemp;
//   double minTemp;
//   String weatherStateName;
//
//   WeatherModel(
//       {required this.date,
//         required this.maxTemp,
//         required this.minTemp,
//         required this.temp,
//         required this.weatherStateName});
//
//   factory WeatherModel.fromJason(dynamic data) {
//     var jasonData = data['forecast']['forecastday'][0]['day'];
//     print(jasonData);
//
//     return WeatherModel(
//         date: data['location']['localtime'],
//         maxTemp: jasonData['maxtemp_c'],
//         minTemp: jasonData['mintemp_c'],
//         temp: jasonData['avgtemp_c'],
//         weatherStateName: jasonData['condition']['text']);
//   }
// }
class LoginModel {
  int? parentId;
  String? parentEmail;
  String? parentName;
  String? token;
  int? status;
  String? message;
  LoginModel(
      {required this.parentEmail,
      required this.parentId,
      required this.parentName,
      required this.token,
      required this.status,
      required this.message});


  factory LoginModel.fromJason(dynamic jasonData) {

    return LoginModel(
        parentEmail: jasonData["data"]["Parent email"],
        parentId: jasonData["data"]["Parent ID"],
        parentName: jasonData["data"]["Parent Name"],
        token: jasonData["data"]["token"],
        status: jasonData["status"],
        message: jasonData["message"]);
  }
}
