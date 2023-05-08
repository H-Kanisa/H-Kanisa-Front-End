import 'package:flutter/material.dart';
import '../../style/pallete.dart';

abstract class formButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget FormButton({
   String text,
   String hint,
   IconData prefix,
   List list,
   VoidCallback action,
})  {
  return Container(
      child: Center(
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(304, 50),
            backgroundColor: AppColor.greenHK,
          ),
          onPressed:action,
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                color: AppColor.whiteHK,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]),
  ));
}
