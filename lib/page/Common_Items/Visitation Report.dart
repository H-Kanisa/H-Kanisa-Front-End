import 'package:flutter/material.dart';

import 'package:responsive_dashboard/component/appbars/CustomAppBar.dart';
import 'package:responsive_dashboard/component/appbars/NavBar.dart';
import 'package:responsive_dashboard/component/navigatormenu.dart';
import 'package:responsive_dashboard/page/Common_Items/Settings.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items/Visitation%20Report/Zone%20Visitation%20Report.dart';
import 'package:responsive_dashboard/page/Common_Items_Page.dart';
import 'package:responsive_dashboard/page/dashboard.dart';

import '../../style/pallete.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Common Items',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: visitationReport(),
  );
}

class visitationReport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<visitationReport> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: CustomAppBar(
          title: "Visitation Report",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => Common_Items())));
          },
        ),
    );
  }
}
