import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/appbars/CustomAppBar.dart';
import 'package:responsive_dashboard/page/Common_Items/Attendance.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import '../component/listview/ListBuilder.dart';
import '../style/pallete.dart';
import 'Common_Items/DataSheet_master.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Common Items',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Common_Items(),
  );
}

class Common_Items extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Common_Items> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: CustomAppBar(
          title: "Common Items",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => Dashboard())));
          },
        ),
        body: ListView(children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Data Sheet Master",
            desc: "Under Development",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          BuildList(
            icon: Icons.people_alt_rounded,
            title: "Attendance",
            desc: "Not Ready",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => attendance(),
            )),
          ),
          /*
          BuildList(
          icon: Icons.person_pin_circle,
          title: "Attendance Report",
          desc: "Brief Description",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => attendanceReport(),
          )),
          ),
          BuildList(
            icon: Icons.person_pin_circle,
            title: "Visitation Report",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => visitationReport(),
            )),
          ),
          BuildList(
            icon: Icons.person_pin_circle,
            title: "Test Components",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TestComponents(),
            )),
          ),*/
        ]));
       // bottomNavigationBar: NavBar());
  }
}
