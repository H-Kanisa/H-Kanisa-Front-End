import 'package:flutter/material.dart';
import '../style/pallete.dart';

class CustomSnack extends StatefulWidget {
  final String text;

  const CustomSnack({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  State<CustomSnack> createState() => _CustomSnackState();
}

class _CustomSnackState extends State<CustomSnack> {
  @override
  Widget build(BuildContext context) {
    return  SnackBar(
        content: Text(widget.text,  style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: AppColor.midGreyHk,
              fontWeight: FontWeight.w300,
            ),),
        backgroundColor: AppColor.greenHK, // Customize the background color
        duration: Duration(seconds: 300), // Customize the duration
        behavior: SnackBarBehavior.floating, // Customize the behavior
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Customize the border radius
        ),
        action: SnackBarAction(
          disabledTextColor: AppColor.redHK,
          textColor: AppColor.greenHK,
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
    

  }


}
