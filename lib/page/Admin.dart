import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/listview/ListBuilder.dart';
import 'package:responsive_dashboard/component/appbars/CustomAppBar.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../component/navigatormenu.dart';
import 'dashboard.dart';
import 'Admin/Adjust Reports.dart';
import 'Admin/Admin Reports.dart';


Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setup',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: Admin(),
    );

class Admin extends StatefulWidget {
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: CustomAppBar(
          title: "Admin",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => IconMenu()));
          }),
      body: ListView(shrinkWrap: true, children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: " Adjust Reports" ?? 'default',
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => adjustReports(),
          )),
        ),
        BuildList(
          title: "Admin Report" ?? 'default',
          icon: Icons.data_object_sharp,
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => adminReports(),
          )),
        ),
      ]),
    );
  }
}
