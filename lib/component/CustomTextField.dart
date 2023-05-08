import 'package:flutter/material.dart';
import '../style/pallete.dart';

class inputText extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Common Items',
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget InputText({
  TextEditingController field,
}) {
  return Column(
    children: <Widget>[
      TextField(
        controller: field,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blue.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )),
      ),
    ],
  );
}
