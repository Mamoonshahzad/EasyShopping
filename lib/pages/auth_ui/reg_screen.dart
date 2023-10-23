import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_firebase_app/controllers/signup_controller.dart';
import 'package:ecom_firebase_app/pages/auth_ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        centerTitle: true,
        title: const Text(
          "Reg Screen",
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
                child: TextFormField(
                  controller: userName,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "User Name",
                      prefixIcon: const Icon(Icons.person),
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
                child: TextFormField(
                  controller: userPhone,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Phone",
                      prefixIcon: const Icon(Icons.phone),
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
                child: TextFormField(
                  controller: userCity,
                  cursorColor: AppConstant.appSecondaryColor,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "City",
                      prefixIcon: const Icon(Icons.location_on),
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
                      obscureText: signUpController.isPasswordVisible.value,
                      controller: userPassword,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPasswordVisible.toggle();
                              },
                              child: signUpController.isPasswordVisible.value
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
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                String name = userName.text.trim();
                String email = userEmail.text.trim();
                String phone = userPhone.text.trim();
                String city = userCity.text.trim();
                String password = userPassword.text.trim();
                String userDeviceToken = "";

                if (name.isEmpty ||
                    email.isEmpty ||
                    phone.isEmpty ||
                    city.isEmpty ||
                    password.isEmpty) {
                  Get.snackbar("Error", "Please enter all details",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appSecondaryColor,
                      colorText: AppConstant.appTextColor);
                } else {
                  UserCredential? userCredential =
                      await signUpController.signUpMethod(
                          name, email, phone, city, password, userDeviceToken);
                  if (userCredential != null) {
                    Get.snackbar("Verify ur account", "Check ur Email ",
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: AppConstant.appTextColor,
                        backgroundColor: AppConstant.appSecondaryColor);
                    FirebaseAuth.instance.signOut();
                    Get.to(const LoginScreen());
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
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have account ",
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen());
                    // FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    "Sign In",
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
  }
}
