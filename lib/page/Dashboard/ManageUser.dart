import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import '../../component/Form/CustomButton.dart';
import '../../component/Form/FormOptions.dart';
import '../../component/Form/FormTitle.dart';
import '../../component/appbars/BottomNav.dart';
import '../Common_Items/DataSheet Master/Register Member.dart';

//import '../pallete.dart';

class manageUsers extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          primary: false,
          backgroundColor: Colors.white,
          toolbarHeight: 150,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: FormTitle(
                      title: "Manage Users",
                      onClicked: () {
                        Navigator.pop(context);
                      })),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            FormText(
                              text: "First Name",
                            ),
                            FormText(text: "Second Name"),
                            FormText(text: "Middle Name"),
                            FormText(text: "Last Name"),
                            FormText(text: "Phone Number"),
                            FormDropDown(text: "Cell", list: cell),
                            FormDropDown(text: "Zone", list: zone),
                            FormDropDown(text: "Church", list: church),
                            FormDropDown(text: "Branch", list: branch),
                            FormButton(
                                text: "Submit",
                                action:
                                    () {}) /*FormButton(
                        text: "Submit",
                        action: () {
                        
                        })*/
                          ],
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ), bottomNavigationBar: BottomNav());
  }
}
