import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Color containerBG = Theme.of(context).brightness == Brightness.dark
        ? AppColor.primaryDark
        : AppColor.whiteColor;
    TextStyle textstyleDark = Theme.of(context).brightness == Brightness.dark
        ? AppStyle.white16Medium
        : AppStyle.black16Medium;
    String imageDark = Theme.of(context).brightness == Brightness.dark
        ? AppImages.birthdayImgDark
        : AppImages.birthdayImgLight;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Container(
        height: height * 0.31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColor.babyBlueColor,
            width: 2,
          ),
          image: DecorationImage(
              image: AssetImage(
                imageDark,
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: containerBG,
              ),
              child: Column(
                children: [
                  Text(
                    "22",
                    style: AppStyle.blue20bold,
                  ),
                  Text(
                    "Dec",
                    style: AppStyle.blue20bold,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: containerBG,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "This is a birthday Party",
                    style: textstyleDark,
                  ),
                  Image.asset(
                    AppImages.heart,
                    color: AppColor.babyBlueColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
