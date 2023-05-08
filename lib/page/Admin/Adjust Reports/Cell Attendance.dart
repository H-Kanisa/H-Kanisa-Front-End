import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Admin.dart';
import '../../../component/appbars/BottomNav.dart';
import '../../../component/appbars/CustomAppBar.dart';
import '../../dashboard.dart';

class CellAttendance extends StatefulWidget {
  @override
  State<CellAttendance> createState() => _CellAttendance();
}

class _CellAttendance extends State<CellAttendance> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Cell Attendance",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dashboard()));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Admin()));
          }),
          bottomNavigationBar: BottomNav(),
    );
  }
}
