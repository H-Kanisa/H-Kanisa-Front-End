import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';

import '../../component/Form/FormOptions.dart';
import '../../component/Form/FormTitle.dart';
import '../Setup_Page.dart';

//import '../pallete.dart';

class addProject extends StatelessWidget {
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
                      title: "Add Project",
                      onClicked: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Setup(),
                        ));
                      })),
              SingleChildScrollView(
                child: Column(
                  children: [
                    FormText(text: "Project"),
                    FormDropDown(text: "Church", list: church),
                    FormDropDown(text: "Branch", list: branch),
                    /*FormButton(
                        text: "Submit",
                        action: () {
                        
                        })*/
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
