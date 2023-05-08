import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/form/CustomButton.dart';
import 'package:responsive_dashboard/component/Form/FormBirthday.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';

import '../../../component/Form/FormOptions.dart';
import '../../../component/Form/FormTitle.dart';
import '../DataSheet_master.dart';
//import '../pallete.dart';

class PickChild extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  child: FormTitle(
                      title: "Pick Child",
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DataSheet(),
                        ));
                      })),
              SingleChildScrollView(
                child: Column(
                  children: [
                    FormText(
                      text: "First Name",
                    ),
                    FormText(text: "Second Name"),
                    FormText(text: "Last Name"),
                    FormText(text: "Phone Number"),
                    FormBirthday(text: "Birthday"),
                    FormDropDown(text: "Cell", list: cell),
                    FormDropDown(text: "Zone", list: zone),
                    FormDropDown(text: "Church", list: church),
                    FormDropDown(text: "Branch", list: branch),
                    FormText(text: "Location"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
