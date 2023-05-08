import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Dashboard/ManageUser.dart';
import 'package:responsive_dashboard/style/pallete.dart';
import '../../page/Settings.dart';

class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: Icon(Icons.settings, size: 27, color: AppColor.greenHK),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Settings(),
              ));
            }),
        SizedBox(width: 8),
        IconButton(
            icon: Icon(Icons.account_circle_rounded,
                size: 27, color: AppColor.greenHK),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => manageUsers(),
              ));
            }),
        SizedBox(width: 10),
      ],
    );
  }
}
