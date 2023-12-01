import 'dart:async';
import 'package:ecom_firebase_app/controllers/get_user_data_controller.dart';
import 'package:ecom_firebase_app/pages/admin_panel/admin_home_screen.dart';
import 'package:ecom_firebase_app/pages/user_panel/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome_screen.dart'; // Import the WelcomeScreen or replace with your actual screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        loggdin(context);
      },
    );
  }

  Future<void> loggdin(BuildContext context) async {
    final GetUserDataController getUserDataController =
        Get.put(GetUserDataController());
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.to(() => const AdminHomeScreen());
      } else {
        Get.to(() => const MainScreen());
      }
    } else {
      Get.to(() => const WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FlutterLogo(size: 200)),
    );
  }
}
