import 'package:flutter/material.dart';

import '../../style/pallete.dart';

abstract class formTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget FormTitle({
  String title,
  IconData icon,
  VoidCallback onClicked,
}) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1.0,
            child: IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10),
                constraints: BoxConstraints(),
                icon: Icon(Icons.arrow_back, color: AppColor.greenHK, size: 32),
                onPressed: onClicked),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10)
                .add(EdgeInsets.only(top: 10)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: AppColor.greenHK,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    ),
  );
}

