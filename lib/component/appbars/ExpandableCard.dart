import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import '../../style/pallete.dart';

class expandableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primaryColor: AppColor.whiteHK),
    );
  }
}


Widget ExpandableCard({
  String title,
  String subtitle,
  String content,
  VoidCallback onClick,
}) {
  return PhysicalModel(
      color: AppColor.midGreyHk,
      child: Center(
        child: ExpansionCard(
          borderRadius: 20,
          //background:
          title: Container(
            child: ListTile(
              title: Transform.translate(
                  offset: Offset(-20, 0),
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        color: AppColor.greyHK),
                  )),
              subtitle: Transform.translate(
                  offset: Offset(-20, 0),
                  child: Text(
                    subtitle ?? '',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        color: AppColor.greyHK),
                  )),
            ),
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Text(
                content ?? '',
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    color: AppColor.greyHK),
              ),
            )
          ],
        ),
      ));
}
