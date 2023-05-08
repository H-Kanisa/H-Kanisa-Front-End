import 'package:flutter/material.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import 'package:responsive_dashboard/component/appbars/appBarActionItems.dart';
import 'package:responsive_dashboard/component/appbars/header.dart';
import 'package:responsive_dashboard/component/cards/infoCard.dart';
import 'package:responsive_dashboard/component/navigatormenu.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Register%20Member.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Cell%20Group.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Church.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Zone.dart';
import '../component/appbars/BottomNav.dart';
import '../component/appbars/NavBar.dart';
import '../component/config/responsive.dart';
import '../component/config/size_config.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

    int _currentIndex = 0;
    
    void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: _drawerKey,
        backgroundColor: AppColor.whiteHK,
        drawer: SizedBox(width: 210, child: IconMenu()),
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
                elevation: 0,
                backgroundColor: AppColor.whiteHK,
                leading: IconButton(
                    onPressed: () {
                      _drawerKey.currentState.openDrawer();
                    },
                    icon: Icon(Icons.menu, size: 27, color: AppColor.greenHK)),
                actions: [
                  AppBarActionItems(),
                ],
              )
            : PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: IconMenu(),
                ),
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth,
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                InfoCard(
                                    image: 'assets/People.png',
                                    // cardColor: Color.fromARGB(28, 25, 51, 51),
                                    label: 'Total \nMembers',
                                    number: '\56,479',
                                    onClicked: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  regMember())));
                                    }),
                                InfoCard(
                                    image: 'assets/Church.png',
                                    label: 'Registered \nChurches',
                                    //  cardColor: Color.fromARGB(7, 149, 193, 61),
                                    number: '\21',
                                    onClicked: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  addChurch())));
                                    }),
                                InfoCard(
                                    image: 'assets/Group.png',
                                    label: 'Harvest \nGroups',
                                    //  cardColor: AppColor.blueSubtleHK,
                                    number: '\147',
                                    onClicked: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  addCell())));
                                    }),
                                InfoCard(
                                    image: 'assets/Zone.png',
                                    // cardColor: AppColor.redSubtleHK,
                                    label: 'Zones \n ',
                                    number: '\57',
                                    onClicked: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  addZone())));
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}
