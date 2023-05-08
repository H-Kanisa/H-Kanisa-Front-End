import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Dashboard/ManageUser.dart';
import 'package:responsive_dashboard/component/cards/ActionCards.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/View%20Members.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Visitation.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import 'package:responsive_dashboard/component/appbars/NavBar.dart';
import 'package:responsive_dashboard/component/appbars/appBarActionItems.dart';
import 'package:responsive_dashboard/component/navigatormenu.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Register%20Member.dart';
import '../../component/config/responsive.dart';
import '../../component/config/size_config.dart';
import '../../style/style.dart';

class People extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: 'People',
                  size: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColor.greyHK),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    ActionCard(
                        image: 'assets/AddMember.png',
                        // cardColor: Color.fromARGB(28, 25, 51, 51),
                        title: 'Add Member',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => regMember())));
                        }),
                    ActionCard(
                        image: 'assets/ViewMembers.png',
                        //  cardColor: Color.fromARGB(7, 149, 193, 61),
                        title: 'View Members',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => viewMembers())));
                        }),
                    ActionCard(
                        image: 'assets/Visitation.png',
                        //  cardColor: AppColor.blueSubtleHK,
                        title: 'Visitation',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Visitation())));
                        }),
                    ActionCard(
                        image: 'assets/ManageUSers.png',
                        //  cardColor: AppColor.blueSubtleHK,
                        title: 'Manage Users',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => manageUsers())));
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 4,
              ),
            ],
          ),
        ));
       //bottomNavigationBar: NavBar());
  }
}
