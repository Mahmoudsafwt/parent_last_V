import 'package:flutter/material.dart';
import 'package:grad_project_last_v/componentes/custom_text_field.dart';
import 'package:grad_project_last_v/componentes/email_validation.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';

import 'package:grad_project_last_v/services/test_new_login_logic.dart';

import '../services/deal_with_token.dart';
//late LoginModel loginModel;
class LoginScreen extends StatefulWidget {
  static String routeName = 'login screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailControlar = TextEditingController(text: 'mahmoud@gmail.com');

  var passControlar = TextEditingController(text: '01007623849');
  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Color(0xff1D9BFC),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Container(
                padding: const EdgeInsetsDirectional.all(5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xff1F9CFC),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextFormComponenet(
                      prefexIcon: const Icon(Icons.email),
                      controller: emailControlar,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter E-mail';
                        }
                        if (!EmailValidation.emailIsValid(text)) {
                          return 'please enter valid email';
                        }
                      },
                      labelText: 'E-mail address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormComponenet(
                      prefexIcon: const Icon(Icons.lock),
                      controller: passControlar,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (text.length < 6) {
                          return 'password must have at least 6 chars';
                        }
                      },
                      labelText: 'password',
                      isPassword: true,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const InkWell(
                        child: Text(
                      'forget your password?',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3495DF)),
                        onPressed: () async{
                          if (formKey.currentState?.validate() == false) return;


                          bool flag=await LoginServiceAfterTesting.login(email: emailControlar.text, password: passControlar.text);
                          if(flag){

                            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
                            print(LoginServiceAfterTesting.parentData);

                          }
                          else{
                            showSampleDialog(context);
                          }


                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showSampleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Credentials'),
          content: const Text('Please enter a valid email and password.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

