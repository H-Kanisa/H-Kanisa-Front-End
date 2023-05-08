import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../component/appbars/CustomAppBar.dart';
import '../../component/listview/ListBuilder.dart';
import '../../component/navigatormenu.dart';
import '../dashboard.dart';
import 'Attendance Report.dart';
import 'DataSheet_master.dart';
import 'Visitation Report.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Settings',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Settings(),
  );
}

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title: "Settings",
            onClickedHome: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Dashboard())));
            },
            onClickedBack: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => IconMenu())));
            }),
        );
  }
}
