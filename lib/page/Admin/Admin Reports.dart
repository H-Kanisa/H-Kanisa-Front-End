import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/main.dart';
import 'package:responsive_dashboard/page/Admin.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Cell%20Attendance.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Demographics.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Department%20Attendance.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Dpt%20Report%20Reminders.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Gen%20Cell%20Attendance.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Gen%20Dpt%20Attendance.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/HOD%20Attendance.dart';
import 'package:responsive_dashboard/page/Admin/Admin%20Reports/Manage%20Cell%20Reports.dart';
import 'package:responsive_dashboard/page/Admin/Admin%20Reports/Manage%20Dpt%20Reports.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet_master.dart';
import 'package:responsive_dashboard/page/Setup_Page.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../../component/appbars/CustomAppBar.dart';
import '../../component/listview/ListBuilder.dart';
import '../../../component/navigatormenu.dart';
import '../dashboard.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'adjustReports',
      color: AppColor.whiteHK,
      theme: ThemeData(primarySwatch: AppColor.colorHK),
      home: adminReports(),
    );

class adminReports extends StatefulWidget {
  @override
  State<adminReports> createState() => _adminReports();
}

class _adminReports extends State<adminReports> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: "Admin Reports",
            onClickedHome: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard()));
            },
            onClickedBack: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Admin()));
            }),
        body: ListView(children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Manage Cell Reports",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => manageCellReports(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Manage Department Reports",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => manageDptReports(),
            )),
          ),
        ]));
  }
}
