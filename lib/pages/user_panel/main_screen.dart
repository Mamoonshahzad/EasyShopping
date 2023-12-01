import 'package:ecom_firebase_app/widgets/banner_widget.dart';
import 'package:ecom_firebase_app/widgets/custom_drawer_widget.dart';
import 'package:ecom_firebase_app/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        centerTitle: true,
        title: const Text("User Main Screen"),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90,
              ),

              //Banners widget
              const BannerWidget(),

              //Heading Widget
              HeadingWidget(
                  headingTitle: 'Categories',
                  headingSubTitle: 'According to your budget',
                  onTap: () {},
                  buttonText: 'See More >'),
            ],
          ),
        ),
      ),
    );
  }
}
