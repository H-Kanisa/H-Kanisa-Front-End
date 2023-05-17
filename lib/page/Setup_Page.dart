import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/listview/ListBuilder.dart';
import 'package:responsive_dashboard/component/appbars/CustomAppBar.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Branch.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Cell%20Group.dart';
import 'package:responsive_dashboard/page/Setup/Add%20College.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Department.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Project.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Zone.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../component/navigatormenu.dart';
import 'Dashboard/ManageUser.dart';
import 'Setup/Add Service Type.dart';
import 'dashboard.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Setup',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: Setup(),
    );

class Setup extends StatefulWidget {
  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: CustomAppBar(
          title: "Setup",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => IconMenu()));
          }),
      body: ListView(children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: " Manage Views",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => manageUsers(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: " Add Cell",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addCell(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Department",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addDepartment(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Zone",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addZone(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add College",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addCollege(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Branch",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addBranch(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Church",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addProject(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Service",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addService(),
          )),
        ),
        BuildList(
          icon: Icons.data_saver_off_sharp,
          title: "Add Project",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => addProject(),
          )),
        ),
      ]),
    );
  }
}
