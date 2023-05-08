import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Dashboard/M-Pesa.dart';
import 'package:responsive_dashboard/page/Common_Items_Page.dart';
import 'package:responsive_dashboard/page/Admin.dart';
import 'package:responsive_dashboard/page/Setup_Page.dart';

import '../style/pallete.dart';
import 'navigator/Navigator.dart';

class IconMenu extends StatefulWidget {
  @override
  State<IconMenu> createState() => _IconMenuState();
}

class _IconMenuState extends State<IconMenu> {
  final padding = EdgeInsets.symmetric(horizontal: 30);

  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);
    return Container(
      child: Drawer(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2),
        color: AppColor.whiteHK,
        child: Column(children: [
          Container(
            child: buildHeader(),
            padding: EdgeInsets.all(8)
                .add(EdgeInsets.only(left: 10))
                .add(safeArea)
                .add(EdgeInsets.only(top: 5)),
            color: AppColor.whiteHK,
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                buildMenuItem(
                    text: 'Dashboard',
                    icon: Icons.dashboard,
                    onClicked: () => Navigator.pop(context)),
                //  onClicked: () => Navigator.of(context).pop()),

                buildMenuItem(
                  text: 'Common Items',
                  icon: Icons.library_books_sharp,
                  onClicked: () => selectedItem(context, 0),
                ),
                buildMenuItem(
                  text: 'M-Pesa',
                  icon: Icons.monetization_on,
                  onClicked: () => selectedItem(context, 3),
                ),

               /*
               *
               *
                buildMenuItem(
                  text: 'Admin',
                  icon: Icons.admin_panel_settings,
                  onClicked: () => selectedItem(context, 1),
                ),

                buildMenuItem(
                  text: 'Setup',
                  icon: Icons.settings_sharp,
                  onClicked: () => selectedItem(context, 2),
                ),
               *
               * */

                Divider(color: Colors.white70),
              ],
            ),
          ),
        ]),
      )),
    );
  }
}

Widget buildHeader() => //  isCollapsed
//= Image.asset("assets/H-Colored.png")
    Builder(
      builder: (context) {
        return Row(children: [
          GestureDetector(onTap: () {Navigator.pushNamed(context, Navigation.dashboard);} ,child: Container(child: Image.asset("assets/main-horizontal.png", width: 130))),
        ]);
      }
    );

Widget buildMenuItem({
  String text,
  IconData icon,
  VoidCallback onClicked,
}) {
  final hoverColor = Colors.red;
  return ListTile(
    leading: Icon(icon, color: AppColor.greyHK),
    dense: true,
    title: Transform.translate(
        offset: Offset(-20, 0),
        child: Text(text,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w800,
                color: AppColor.greyHK))),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Common_Items(),
      ));

      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Admin(),
      ));

      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Setup(),
      ));

      break;

    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MPesa(),
      ));

      break;
  }
}
