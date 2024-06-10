import 'package:flutter/material.dart';
import 'package:grad_project_last_v/screens/change_password_screen.dart';
import 'package:grad_project_last_v/screens/home_screen.dart';
import 'package:grad_project_last_v/screens/login_screen.dart';
import 'package:grad_project_last_v/screens/map_screen.dart';
import 'package:grad_project_last_v/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ChangePassword.routeName:(context)=>ChangePassword(),

        MapScreen.routeName:(context)=>const MapScreen()
      },
    );
  }
}
