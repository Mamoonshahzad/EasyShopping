import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreen();
}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecondaryColor,
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: Get.size.height * .3,
                  width: Get.width * .8,
                  child: Image.network(
                      "https://relprod.relianceanimation.in/dist/images/login_illustration1.png")),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.appSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.mail),
                        contentPadding: const EdgeInsets.only(top: 2, left: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () async {
                  String email = userEmail.text.trim();

                  if (email.isEmpty) {
                    Get.snackbar('Error', 'Please enter all details',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor);
                  } else {
                    String email = userEmail.text.trim();
                    forgetPasswordController.forgetPasswordMethod(email);
                  }
                },
                child: Container(
                    width: Get.width / 3,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppConstant.appSecondaryColor,
                    ),
                    child: const Center(
                        child: Text("Forget",
                            style:
                                TextStyle(color: Colors.white, fontSize: 19)))),
              ),
            ],
          ),
        ),
      );
    });
  }
}
