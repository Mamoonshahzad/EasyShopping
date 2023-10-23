import 'package:ecom_firebase_app/controllers/google_signin_controller.dart';
import 'package:ecom_firebase_app/pages/auth_ui/login_screen.dart';
import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstant.appSecondaryColor,
        title: const Text(
          "Happy Shopping",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height * .4,
            color: AppConstant.appSecondaryColor,
            child: const Center(
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 66,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Welcome to EShop",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppConstant.appSecondaryColor),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: Get.width * .8,
            height: 60,
            decoration: BoxDecoration(
              color: AppConstant.appSecondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                _googleSignInController.signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(
                        "https://th.bing.com/th/id/R.204fb081e13267c09071f55826627078?rik=uji2yfjBPiddvQ&pid=ImgRaw&r=0"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Login with google",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Get.to(const LoginScreen()),
            child: Container(
              width: Get.width * .8,
              height: 60,
              decoration: BoxDecoration(
                color: AppConstant.appSecondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login with email",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
