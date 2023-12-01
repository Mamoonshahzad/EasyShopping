import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;

  Future<void> forgetPasswordMethod(String userEmail) async {
    try {
      EasyLoading.show(status: "Please wait...");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
          "Request Sent Successfully", "Password reset link sent to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondaryColor,
          colorText: AppConstant.appTextColor);

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e,",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondaryColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
