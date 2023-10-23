import 'package:ecom_firebase_app/pages/auth_ui/login_screen.dart';
import 'package:ecom_firebase_app/pages/auth_ui/reg_screen.dart';
import 'package:ecom_firebase_app/pages/auth_ui/welcome_screen.dart';
import 'package:ecom_firebase_app/pages/user_panel/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegScreen(),
      builder: EasyLoading.init(),
    );
  }
}
