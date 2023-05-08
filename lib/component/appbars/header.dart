import 'package:flutter/material.dart';

import '../../style/pallete.dart';
import '../../style/style.dart';
import '../config/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: 'Dashboard',
                  size: 25,
                  fontWeight: FontWeight.w800,
                  color: AppColor.greyHK),
              PrimaryText(
                text: 'HFC\nHead Quarters',
                size: 16,
                fontWeight: FontWeight.w300,
                color: AppColor.greyHK,
              )
            ]),
      ),
      Spacer(
        flex: 1,
      ),
      Expanded(
        flex: Responsive.isDesktop(context) ? 1 : 3,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.redSubtleHK,
              contentPadding: EdgeInsets.only(left: 40.0, right: 5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColor.whiteHK),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColor.whiteHK),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.search, color: AppColor.redHK),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: AppColor.redHK,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w300,
                  fontSize: 14)),
        ),
      ),
    ]);
  }
}
