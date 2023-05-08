import 'package:flutter/material.dart';

import '../../style/pallete.dart';

abstract class formText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget FormText({
  String text,
  String hint,
  TextEditingController controller,
  IconData prefix,
  IconData suffix,
  VoidCallback onClicked,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 14,
              color: AppColor.greyHK,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 3)),
      TextFormField(
        maxLines: 3,
       
        controller: controller,
        cursorColor: AppColor.greenHK,
        minLines: 1,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $text';
          }
          return null;
        },
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColor.midGreyHk,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          hintText: "Enter $text",
          hintStyle: TextStyle(
              fontSize: 14,
              color: AppColor.offWhiteHK,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w100),
          focusColor: AppColor.midGreyHk,
          //prefixIcon: Icon(prefix, color: AppColor.midGreyHk),
          suffixIcon: Icon(suffix, color: AppColor.midGreyHk),
          isDense: true,
          ////
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Color.fromARGB(64, 236, 236, 236),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColor.greenHK,
                width: 2,
              )),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 7))
    ],
  );
}

Widget PasswordField({
  String text,
  String hint,
  IconData prefix,
  IconData suffix,
  VoidCallback onClicked,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 14,
              color: AppColor.greyHK,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 3)),
      TextFormField(
        maxLines: 3,
        cursorColor: AppColor.greenHK,
        minLines: 1,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColor.midGreyHk,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          hintText: "Enter $text",
          hintStyle: TextStyle(
              color: AppColor.offWhiteHK,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w100),
          focusColor: AppColor.midGreyHk,
          //prefixIcon: Icon(prefix, color: AppColor.midGreyHk),
          suffixIcon: Icon(suffix, color: AppColor.midGreyHk),
          isDense: true,
          ////
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide.none),
          fillColor: Color.fromARGB(64, 236, 236, 236),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColor.greenHK,
                width: 2,
              )),
        ),
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 7))
    ],
  );
}
