import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/config/size_config.dart';
import '../../style/pallete.dart';
import 'package:responsive_dashboard/style/style.dart';
import '../config/responsive.dart';

// ignore: must_be_immutable
class ActionCard extends StatelessWidget {
  final String image;
  final String label;
  final String title;
  final Color cardColor;
  VoidCallback onClicked;

  ActionCard(
      {this.image, this.label, this.title, this.onClicked, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        constraints: BoxConstraints(
            minWidth: Responsive.isDesktop(context)
                ? 700
                : SizeConfig.screenWidth / 2 - 40),
        padding: EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
            right: Responsive.isMobile(context) ? 20 : 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.scaffoldColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 80),
            PrimaryText(
              text: title,
              size: 18,
              color: AppColor.blueHK,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
