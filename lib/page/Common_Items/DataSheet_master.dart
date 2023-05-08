import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Pick%20Child.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Register%20Child.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Register%20Member.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/View%20Members.dart';
import 'package:responsive_dashboard/page/Common_Items_Page.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../../component/appbars/CustomAppBar.dart';
import '../../component/listview/ListBuilder.dart';
import 'DataSheet Master/Register Visitor.dart';

Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Common_Items',
    color: AppColor.whiteHK,
    theme: ThemeData(
        primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
    home: DataSheet(),
  );
}

class DataSheet extends StatefulWidget {
  @override
  State<DataSheet> createState() => DataSheetState();
}

class DataSheetState extends State<DataSheet> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      appBar: CustomAppBar(
          title: "Data Sheet Master",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => Common_Items())));
          },
          onClickedBack: () {
            Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => Common_Items())));
          }),
      body: ListView(children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        BuildList(
          icon: Icons.person_add_alt,
          title: "Register Member",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => regMember(),
          )),
        ),
        BuildList(
          icon: Icons.phone,
          title: "Register Visitor",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => regVisitor(),
          )),
        ),
        BuildList(
          icon: Icons.child_care_rounded,
          title: "Register Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegChild(),
          )),
        ),
        BuildList(
          icon: Icons.child_care_rounded,
          title: "View Members",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => viewMembers(),
          )),
        ),
        BuildList(
          icon: Icons.child_care_sharp,
          title: "Drop Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
        BuildList(
          icon: Icons.child_care,
          title: "Pick Child",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PickChild(),
          )),
        ),
        BuildList(
          icon: Icons.person_pin_circle_rounded,
          title: "Visitation",
          onClicked: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DataSheet(),
          )),
        ),
      ]),
    );
  }
}
