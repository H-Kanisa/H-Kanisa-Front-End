import 'package:flutter/material.dart';
import '../../style/pallete.dart';

class buildList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Common Items',
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}

Widget BuildList({
  String title,
  String desc,
  IconData icon,
  VoidCallback onClicked,
}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 15),
    child: PhysicalModel(
      clipBehavior: Clip.none,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Center(
        child: Container(
            height: 68,
            child: ListTile(
                dense: true,
                leading: Transform.translate(
                    offset: Offset(0, 10),
                    child: Icon(icon, color: AppColor.midGreyHk)),
                title: Transform.translate(
                    offset: Offset(-15, 10),
                    child: Text(
                      title ?? "",
                      style: TextStyle(
                          color: AppColor.midGreyHk,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                /*
             *
              subtitle: Transform.translate(
              offset: Offset(-20, 0),
                child:Text(
                desc ?? "",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColor.midGreyHk,
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              )),
             *
             */
                trailing: Transform.translate(
                  offset: Offset(-0, 10),
                  child: IconButton(
                      icon: Icon(Icons.chevron_right_rounded),
                      iconSize: 25,
                      onPressed: onClicked),
                ),onTap: onClicked)),
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 10)
        .add(EdgeInsets.symmetric(horizontal: 18)),
  );
}
