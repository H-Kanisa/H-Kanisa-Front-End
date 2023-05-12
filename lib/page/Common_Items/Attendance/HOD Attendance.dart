import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Common_Items/Attendance.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../../../component/Form/FormText.dart';
import '../../../component/appbars/CustomAppBar.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: hodAttendance(),
    );

class hodAttendance extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
            title: "HOD Attendance",
            onClickedHome: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard()));
            },
            onClickedBack: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => attendance()));
            }),body: SingleChildScrollView(
             child: Column(
               children: [
                 FormText(text: 'Service type'),
                 FormText(text: 'Date')
               ],
             )
            ),
      ),
    );
  }
}
