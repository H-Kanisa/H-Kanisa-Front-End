import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/cards/ActionCards.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import 'package:responsive_dashboard/component/appbars/appBarActionItems.dart';
import 'package:responsive_dashboard/component/navigatormenu.dart';
import '../../component/appbars/BottomNav.dart';
import '../../component/config/responsive.dart';
import '../../component/config/size_config.dart';
import '../../style/style.dart';
import '../M-Pesa/Building.dart';
import '../M-Pesa/Offering.dart';
import '../M-Pesa/Special.dart';
import '../M-Pesa/Tithe.dart';

class MPesa extends StatelessWidget {
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
                  text: 'M-Pesa',
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
                        image: 'assets/Cash.png',
                        // cardColor: Color.fromARGB(28, 25, 51, 51),
                        title: '  Tithe',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Tithe())));
                        }),
                    ActionCard(
                        image: 'assets/Cash.png',
                        //  cardColor: Color.fromARGB(7, 149, 193, 61),
                        title: '  Offering',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Offering())));
                        }),
                    ActionCard(
                        image: 'assets/Cash.png',
                        //  cardColor: AppColor.blueSubtleHK,
                        title: '  Building',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Building())));
                        }),
                    ActionCard(
                        image: 'assets/Cash.png',
                        //  cardColor: AppColor.blueSubtleHK,
                        title: '  Special',
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => SpecialOffering())));
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
        bottomNavigationBar: BottomNav());
  }
}
