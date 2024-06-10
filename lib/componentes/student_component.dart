import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grad_project_last_v/screens/map_screen.dart';
import 'package:grad_project_last_v/services/get_location.dart';
import 'package:grad_project_last_v/services/get_student_status.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../screens/splash_screen.dart';
import '../services/test_new_login_logic.dart';

class StudentView extends StatelessWidget {
  String imagePath;
  String studentName;
  String studentClass;
  String studentGrade;
  String studentStatus;
  String studentId;

  StudentView(this.imagePath, this.studentClass, this.studentGrade,
      this.studentName, this.studentStatus, this.studentId);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () async {
        String status = await GetStudentStatus.getStatus(int.parse(studentId),
            LoginServiceAfterTesting.parentData['data']['token']);
        if (status == 'On Bus') {
          await GetLocation.getStudentLocation(
              LoginServiceAfterTesting.parentData['data']['token'],
              int.parse(studentId));
          //print('3333333333333   $studentId  ####################');
          Navigator.pushNamed(context, MapScreen.routeName);
        } else {
          location.clear();
          Navigator.pushNamed(context, MapScreen.routeName);
        }

        //double latitude, double longitude
        // mahmoudsafwat649@gmail.com

        //010Msfm91353583
//30.7273722
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color(0xff1D9BFC))),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imagePath),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Column(
              children: [
                Text(
                  studentName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Text('class: $studentClass',
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(
                      width: width * 0.08,
                    ),
                    Text('Grade: $studentGrade',
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  children: [
                    Text('status: $studentStatus',
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                    // SizedBox(
                    //   width: width * 0.08,
                    // ),

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   void initLocation() {
    // Periodically fetch location from backend
    Timer.periodic(const Duration(seconds: 5), (timer) {
      GetLocation.getStudentLocation(
        LoginServiceAfterTesting.parentData['data']['token'],
        int.parse(studentId),
      );
    });
  }
}
