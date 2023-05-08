import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Admin.dart';
import 'package:responsive_dashboard/page/Admin/Adjust%20Reports/Gen%20Cell%20Attendance.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../../component/appbars/CustomAppBar.dart';
import '../../component/listview/ListBuilder.dart';
import '../dashboard.dart';
import 'Adjust Reports/Demographics.dart';
import 'Adjust Reports/Department Attendance.dart';
import 'Adjust Reports/Dpt Report Reminders.dart';
import 'Adjust Reports/Gen Dpt Attendance.dart';
import 'Adjust Reports/HOD Attendance.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'adjustReports',
      color: AppColor.whiteHK,
      theme: ThemeData(primarySwatch: AppColor.colorHK),
      home: adjustReports(),
    );

class adjustReports extends StatefulWidget {
  @override
  State<adjustReports> createState() => _adjustReports();
}

class _adjustReports extends State<adjustReports> {
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
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Cell Attendance",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => adjustReports(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Demographics",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Demographic(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Departmemt Attendance",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => dptAttendance(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "Department Report Reminders",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => dptReport(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "General Cell Attendance",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => genCellAtt(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "General Department Attendance",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => genDptAtt(),
            )),
          ),
          BuildList(
            icon: Icons.data_saver_off_sharp,
            title: "HOD Attendance",
            desc: "Brief Description",
            onClicked: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => hodAtt(),
            )),
          ),
        ]));
  }
}
