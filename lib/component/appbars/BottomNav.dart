import 'package:flutter/material.dart';
import '../../page/Common_Items/Attendance Report.dart';
import '../../page/Common_Items/DataSheet Master/Register Member.dart';
import '../../page/Dashboard/M-Pesa.dart';
import '../../page/Settings.dart';
import '../../page/dashboard.dart';
import '../../style/pallete.dart';
import 'package:responsive_dashboard/page/Dashboard/ManageUser.dart';

import '../navigator/Navigator.dart';

class BottomNav extends StatefulWidget {
  final Function(int) onTap;

  BottomNav({this.onTap});

  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String registerMember = '/registerMember';
  static const String viewMember = '/viewMember';
  static const String manageUser = '/manageUser';

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int _currentIndex = 2;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.none,
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: const EdgeInsets.all(7.5).add(
            EdgeInsets.symmetric(horizontal: 20)
                .add(EdgeInsets.only(bottom: 5))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColor.scaffoldColor,
          ),
          height: 75,
          child: Center(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BM(
                    title: 'Register\nMember',
                    onClick: () {
                      Navigator.pushNamed(context, Navigation.registerMember);
                    },
                    icon: Icons.add_circle,
                    index: 0,
                  ),
                  BM(
                    title: 'Attendance\nReport',
                    onClick: () {
                      Navigator.pushNamed(context, Navigation.attendanceReport);
                    },
                    icon: Icons.view_comfortable,
                    index: 1,
                  ),
                  BM(
                    title: 'Home',
                    onClick: () {
                      Navigator.pushNamed(context, Navigation.home);
                    },
                    icon: Icons.home,
                    index: 2,
                  ),
                  BM(
                    title: 'Manage\nViews',
                    onClick: () {
                      Navigator.pushNamed(context, Navigation.manageUser);
                    },
                    icon: Icons.person,
                    index: 3,
                  ),
                  BM(
                    title: 'M-Pesa',
                    onClick: () {
                     Navigator.pushNamed(context, Navigation.mPesa);
                    },
                    icon: Icons.monetization_on_rounded,
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget BM({
    String title,
    VoidCallback onClick,
    IconData icon,
    int index,
    String image,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                  icon,
                  
                  size: 30,
                  color: _currentIndex == index
                      ? AppColor.greenHK
                      : AppColor.greyHK,
                ),
               
          ],
        ),
      ),
    );
  }
}
