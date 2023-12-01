import 'package:ecom_firebase_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;

  const HeadingWidget(
      {super.key,
      required this.headingTitle,
      required this.headingSubTitle,
      required this.onTap,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headingTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey.shade800)),
                Text(headingSubTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey.shade500))
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: AppConstant.appSecondaryColor, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppConstant.appSecondaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
