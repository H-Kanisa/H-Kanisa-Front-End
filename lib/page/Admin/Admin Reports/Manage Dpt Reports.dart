import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/main.dart';
import 'package:responsive_dashboard/page/Admin.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet_master.dart';
import 'package:responsive_dashboard/page/Setup_Page.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../../../component/appbars/CustomAppBar.dart';
import '../../../component/listview/ListBuilder.dart';
import '../../../component/navigatormenu.dart';
import '../../dashboard.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'manageDptReports',
      color: AppColor.whiteHK,
      theme: ThemeData(primarySwatch: AppColor.colorHK),
      home: manageDptReports(),
    );

class manageDptReports extends StatefulWidget {
  @override
  State<manageDptReports> createState() => _manageDptReports();
}

class _manageDptReports extends State<manageDptReports> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Adjust Reports",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Admin()));
          }),
    );
  }
}
