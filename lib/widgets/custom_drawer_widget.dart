import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/auth_ui/welcome_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: AppConstant.appMainColor,
        child: Wrap(
          runSpacing: 10,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('Mamoon', style: TextStyle(color: Colors.white)),
                subtitle: Text('Version 2.2.11',
                    style: TextStyle(color: Colors.white)),
                leading: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text('M', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const Divider(
                indent: 10, endIndent: 10, thickness: 1.5, color: Colors.grey),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('Home', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.home, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('Products', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.shopping_cart, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('Orders', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.shopping_bag, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text('Contact', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.contact_support, color: Colors.white),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth auth = FirebaseAuth.instance;
                  await auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => const WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  'LogOut',
                  style: TextStyle(color: Colors.white),
                ),
                leading: const Icon(Icons.logout, color: Colors.white),
                trailing: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
