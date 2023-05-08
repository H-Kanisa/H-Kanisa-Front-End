import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Dashboard/ManageUser.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'package:responsive_dashboard/page/Dashboard/People.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../style/pallete.dart';

void main() {
  runApp(ScreenWrapper());
}

class ScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 1;

  final pages = [
    People(),
    Dashboard(),
    manageUsers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
                    FluentSystemIcons.ic_fluent_person_filled,
                    color: AppColor.greenHK,
                    size: 38,
                  )
                : const Icon(
                    FluentSystemIcons.ic_fluent_person_regular,
                    color: AppColor.midGreyHk,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
                    FluentSystemIcons.ic_fluent_home_filled,
                    color: AppColor.greenHK,
                    size: 38,
                  )
                : const Icon(
                    FluentSystemIcons.ic_fluent_home_regular,
                    color: AppColor.midGreyHk,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
                    FluentSystemIcons.ic_fluent_apps_list_filled,
                    color: AppColor.greenHK,
                    size: 38,
                  )
                : const Icon(
                    FluentSystemIcons.ic_fluent_apps_list_regular,
                    color: AppColor.midGreyHk,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
