

import 'package:flutter/material.dart';

import 'package:grad_project_last_v/screens/home_screen.dart';
import 'package:grad_project_last_v/services/get_student_info.dart';

import 'package:grad_project_last_v/services/test_new_login_logic.dart';



//
List<dynamic> studentList = [];
//List<String> studentStatus = [];

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    GetStudentInfo.getStudentInformation(
        LoginServiceAfterTesting.parentData['data']['token'],
        LoginServiceAfterTesting.parentData['data']['Parent ID']);


  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              width: width * 0.7,
              height: height * 0.7,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/splach image.png'))),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: width * 0.6,
                height: height * 0.08,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff3495DF),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
