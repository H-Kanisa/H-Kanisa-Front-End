import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_dashboard/page/Dashboard/ManageUser.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'package:responsive_dashboard/page/Dashboard/People.dart';
import 'package:responsive_dashboard/page/Settings.dart';

import '../../style/pallete.dart';

class NavBarWhite extends StatefulWidget {
  @override
  NavBarWhiteState createState() => NavBarWhiteState();
}

class NavBarWhiteState extends State<NavBarWhite> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .120,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .01  ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => listOfPages[index],
              ));
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
           child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .25
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .25: 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? AppColor.whiteHK
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => listOfPages[index],
                    ));
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width:
                                  index == currentIndex ? displayWidth * .13 : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? '${listOfStrings[index]}'
                                    : '',
                                style: TextStyle(
                                  color: AppColor.greyHK,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width:
                                  index == currentIndex ? displayWidth * .03 : 20,
                            ),
                            IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .076,
                                  color: index == currentIndex
                                      ? AppColor.greyHK
                                      : AppColor.midGreyHk,
                                ),
                                onPressed: () {
                                  /*
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => People(),
                                ));*/

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => listOfPages[index],
                                  ));
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.people,
    Icons.person_rounded,
    Icons.settings_rounded,
  ];

  List listOfPages = [Dashboard(), People(), manageUsers(), Settings()];

  List<String> listOfStrings = [
    'Home',
    'Favorite',
    'Account',
    'Settings',
  ];
  List<int> index = [0, 1, 2, 3];
  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));

        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => People(),
        ));

        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => manageUsers()));

        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));

        break;
    }
  }
}
