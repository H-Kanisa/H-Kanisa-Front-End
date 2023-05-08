import 'package:flutter/material.dart';
import '../../page/Common_Items/DataSheet Master/Register Member.dart';
import '../../page/dashboard.dart';
import '../../style/pallete.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  NavBar({this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.none,
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(color: AppColor.scaffoldColor, ),
        height: 70,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BM(
                title: 'Register\nMember',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => regMember())));
                },
                icon: Icons.add_circle),
            BM(
                title: 'Attendance\nReport',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Dashboard())));
                },
                icon: Icons.view_comfortable),
            BM(
                title: 'Home',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Dashboard())));
                },
                icon: Icons.home_filled),
            BM(
                title: 'Home',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Dashboard())));
                },
                icon: Icons.person),
            BM(
                title: 'Settings',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Dashboard())));
                },
                icon: Icons.settings),
          ],
        )),
      ),
    );
  }

  Widget BM({String title, VoidCallback onClick, IconData icon}) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0).add(EdgeInsets.only(bottom: 10)),
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            child: Column(
              children: [
                Icon(icon, size: 35),
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.textGreyHK,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
