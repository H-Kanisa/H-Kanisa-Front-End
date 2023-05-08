import 'package:flutter/material.dart';

import '../../style/pallete.dart';

class customAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Common Items',
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget CustomAppBar({
  String title,
  VoidCallback onClickedBack,
  VoidCallback onClickedHome,
}) {
  return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColor.redHK),
          onPressed: onClickedHome),
      actions: [
        IconButton(
            icon: Image.asset("H_Colored.png"),
            iconSize: 35,
            onPressed: onClickedBack),
        Padding(padding: EdgeInsets.all(3)),
      ],
      elevation: 0.0,
      toolbarHeight: 72,
      title: Text(title,
          style: TextStyle(
              color: AppColor.greenHK,
              fontFamily: 'Poppins',
              fontSize: 23,
              fontWeight: FontWeight.w700)),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            /*
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 0),
                blurRadius: 10,
                color: AppColor.offWhiteHK,
              )
            ],
            */
            gradient: LinearGradient(
                colors: [AppColor.whiteHK, AppColor.whiteHK],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        padding: EdgeInsets.only(bottom: 38),
      ));
}
