import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Common_Items/Attendance.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../../../component/appbars/BottomNav.dart';
import '../../../component/appbars/CustomAppBar.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cell Attendance',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: cellAttendance(),
    );

class cellAttendance extends StatelessWidget {
  Widget build(BuildContext context) {
    Scaffold(
      appBar: CustomAppBar(
          title: "Cell Attendance",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => attendance()));
          }),
      bottomNavigationBar: BottomNav(),
    );
  }
}
