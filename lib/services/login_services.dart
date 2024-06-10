import 'dart:convert';

import 'package:grad_project_last_v/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
   Future<LoginModel> login({required String email, required String password}) async {
    Uri url = Uri.parse(
        'https://gp-saveurkid.up.railway.app/api/Parentlogin?Email=$email&Password=$password');
    http.Response response = await http.post(url);

    Map<String, dynamic> parentInfo = jsonDecode(response.body);

    LoginModel loginModel=LoginModel.fromJason(parentInfo);


    return loginModel;

  }
}
