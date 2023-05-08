import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../style/pallete.dart';

abstract class formDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget FormDropDown({
   String text,
   TextEditingController controller,
   String hint,
   IconData prefix,
   List list,
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
      DropdownButtonFormField2(
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColor.midGreyHk,
            fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          hintText: "   Select $text",
          hintStyle: TextStyle(
              fontSize: 14,
              color: AppColor.offWhiteHK,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w100),
          focusColor: AppColor.midGreyHk,
          //prefixIcon: Icon(prefix, color: AppColor.midGreyHk),

          ////
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),

          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
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
        isExpanded: true,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 0, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        items: list
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),

        // ignore: missing_return
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {

        },
      ),
      Padding(padding: EdgeInsets.symmetric(vertical: 7))
    ],
  );
}
