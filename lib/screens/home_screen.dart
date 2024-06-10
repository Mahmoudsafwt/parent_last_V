import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grad_project_last_v/screens/announcement_screen.dart';
import 'package:grad_project_last_v/screens/change_password_screen.dart';
import 'package:grad_project_last_v/screens/list_all_students.dart';
import 'package:grad_project_last_v/screens/map_screen.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';

import 'package:grad_project_last_v/screens/tracking_screen.dart';
import 'package:grad_project_last_v/services/logout.dart';
import 'package:grad_project_last_v/services/test_new_login_logic.dart';

import 'package:http/http.dart' as http;
import '../services/get_student_status.dart';
import 'login_screen.dart';

int currentTabIndex = 0;
List<int>studentsIDs=[];


//Map<String,dynamic>studentStatus={};

class HomeScreen extends StatefulWidget {
  static String routeName = 'home screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
void initState() {
  super.initState();

 //GetStudentStatus.getStatus(st,LoginServiceAfterTesting.parentData['data']['token']);
}


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double size = 100.0;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            currentIndex: currentTabIndex,
            selectedItemColor: Color(0xffFFFFFF),
            iconSize: 30,
            backgroundColor: Color(0xff0D63A7),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/tracking.png')),
                label: 'Track',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/images/announcement icon.png')),
                label: 'Announcement',
              ),
            ]),
        //backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              actions: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const ImageIcon(
                      AssetImage(
                        'assets/images/Profile.png',
                      ),
                      size: 34,
                    )),
              ],
              backgroundColor: const Color(0xff0D63A7),
            )),
        body: pages[currentTabIndex],
        drawer: Drawer(
          width: width * 0.85,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xff0D63A7),
                ),
                child: Row(
                  children: [
                    Container(
                        width: size,
                        height: size,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/profile image.png")))),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${LoginServiceAfterTesting.parentData['data']['Parent Name']}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${LoginServiceAfterTesting.parentData['data']['Parent email']}',
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/attendance icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'Attendance',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentTabIndex = 2;
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/announcement icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'Announcement',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ChangePassword.routeName);
                },
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/password icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/my account icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'My Account',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/about us icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'About Us',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  LogoutService.logout(LoginServiceAfterTesting.parentData['data']['token']);
                  LoginServiceAfterTesting.clearParentData();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);


                },
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const ImageIcon(
                            AssetImage(
                              'assets/images/logout icon.png',
                            ),
                            size: 35,
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          const Text(
                            'Logout',
                            style: TextStyle(
                                color: Color(0xff636262), fontSize: 18),
                          )
                        ],
                      ),
                      const Divider(
                        color: Color(0xff636262),
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> pages = [
    const ListAllStudents(),
     TrackingScreen(),
    const AnnouncementScreen(),
  ];

}
