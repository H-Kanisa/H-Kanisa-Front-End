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
      title: 'manageCellReports',
      color: AppColor.whiteHK,
      theme: ThemeData(primarySwatch: AppColor.colorHK),
      home: manageCellReports(),
    );

class manageCellReports extends StatefulWidget {
  @override
  State<manageCellReports> createState() => _manageCellReports();
}

class _manageCellReports extends State<manageCellReports> {
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
      body: ListView(children: <Widget>[
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Register Visitor",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Record Temperature",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Register Member",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "View Members",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Register Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Drop Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Pick Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.settings_applications_sharp,
          title: "Visitation",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
      ]),
    );
  }
}
