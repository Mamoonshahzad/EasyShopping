import 'package:ecom_firebase_app/controllers/signIn_controller.dart';
import 'package:ecom_firebase_app/pages/admin_panel/admin_home_screen.dart';
import 'package:ecom_firebase_app/pages/auth_ui/forget_password_screen.dart';
import 'package:ecom_firebase_app/pages/auth_ui/reg_screen.dart';
import 'package:ecom_firebase_app/pages/user_panel/main_screen.dart';
import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../controllers/get_user_data_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPass = TextEditingController();
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(
                      () => TextFormField(
                        controller: userPass,
                        obscureText: signInController.isPasswordVisible.value,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  signInController.isPasswordVisible.toggle();
                                },
                                child: signInController.isPasswordVisible.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            contentPadding:
                                const EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const ForgetPasswordScreen());
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () async {
                  String email = userEmail.text.trim();
                  String password = userPass.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar('Error', 'Please enter all details',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecondaryColor,
                        colorText: AppConstant.appTextColor);
                  } else {
                    UserCredential? userCredential =
                        await signInController.signInMethod(email, password);

                    var userData = await getUserDataController
                        .getUserData(userCredential!.user!.uid);

                    if (userCredential.user!.emailVerified) {
                      if (userData[0]['isAdmin'] == true) {
                        Get.snackbar(
                            'Success Admin Login', 'Login Successful',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor);
                        Get.to(() => const AdminHomeScreen());
                      } else {
                        Get.snackbar('Success User Login', 'Login Successful',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor);

                        Get.to(() => const MainScreen());
                      }
                    } else {
                      Get.snackbar(
                          'Error', 'Please Verify ur email before login',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecondaryColor,
                          colorText: AppConstant.appTextColor);
                    }
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
                        child: Text("Log In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 19)))),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account ",
                      style: TextStyle(fontSize: 18)),
                  GestureDetector(
                    onTap: () => Get.to(const RegScreen()),
                    child: const Text(
                      "Create",
                      style: TextStyle(
                          fontSize: 18, color: AppConstant.appSecondaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
