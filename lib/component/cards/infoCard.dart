import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/config/size_config.dart';
import '../../style/pallete.dart';
import 'package:responsive_dashboard/style/style.dart';
import '../config/responsive.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  final String image;
  final String label;
  final String number;
  final Color cardColor;
  VoidCallback onClicked;

  InfoCard(
      {this.image, this.label, this.number, this.onClicked, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        constraints: BoxConstraints(
            minWidth: Responsive.isDesktop(context)
                ? 200
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
            Image.asset(image, width: 45),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            PrimaryText(text: label, fontWeight: FontWeight.w600, color: AppColor.greyHK, size: 16),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            PrimaryText(
              text: number,
              size: 30,
              color: AppColor.blueHK,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
