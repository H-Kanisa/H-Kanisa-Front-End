import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/FormBirthday.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';
import '../../../component/Form/CustomButton.dart';
import '../../../component/Form/FormOptions.dart';
import '../../../component/Form/FormTitle.dart';
import '../../../component/appbars/BottomNav.dart';
import '../DataSheet_master.dart';

class regMember extends StatefulWidget {
  @override
  State<regMember> createState() => _regMemberState();
}

class _regMemberState extends State<regMember> {
  final _firstname = TextEditingController();
  final _middlename = TextEditingController();
  final _lastname = TextEditingController();
  final _zone = TextEditingController();
  final _church = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _loveGroup = TextEditingController();
  final _branch = TextEditingController();
  final _birthday = TextEditingController();

  // Future<void> regMember() async {
  //   final firstName = _firstname.text.trim();
  //   final middleName = _middlename.text.trim();
  //   final lastname = _lastname.text.trim();
  //   final phoneNumber = _phoneNumber.text.trim();
  //   final birthday = _birthday.text.trim();
  //   final loveGroup = _loveGroup.text.trim();
  //   final zone = _zone.text.trim();
  //   final church = _church.text.trim();
  //   final branch = _branch.text.trim();

  //   await FirebaseFirestore.instance.collection('members').add({
  //     "firstname": firstName,
  //     "middlename": middleName,
  //     "lastname": lastname,
  //     "phoneNumber": phoneNumber,
  //     "birthday": birthday,
  //     "loveGroup": loveGroup,
  //     "zone": zone,
  //     "church": church,
  //     "branch": branch,
  //   });

  //   // Clear the text fields after successful submission
  //   _firstname.clear();
  //   _middlename.clear();
  //   _lastname.clear();
  //   _phoneNumber.clear();
  //   _birthday.clear();
  //   _loveGroup.clear();
  //   _zone.clear();
  //   _church.clear();
  //   _branch.clear();
  // }

  @override
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
                  title: "Register Member",
                  onClicked: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataSheet(),
                    ));
                  },
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    FormText(text: "First Name", controller: _firstname),
                    FormText(text: "Middle Name", controller: _middlename),
                    FormText(text: "Last Name", controller: _lastname),
                    FormText(text: "Phone Number", controller: _phoneNumber),
                    FormBirthday(text: "Birthday", controller: _birthday),
                    FormDropDown(
                        text: "Cell", list: cell, controller: _loveGroup),
                    FormDropDown(text: "Zone", list: zone, controller: _zone),
                    FormDropDown(
                        text: "Church", list: church, controller: _church),
                    FormDropDown(
                        text: "Branch", list: branch, controller: _branch),
                    FormText(text: "Location"),
                    FormButton(
                      text: "Submit",
                      action: () {
                        //creates a firestore collection reference
                        CollectionReference collRef =
                            FirebaseFirestore.instance.collection('members');
                        collRef.add({
                          "firstname": _firstname.text,
                          "middlename": _middlename.text,
                          "lastname": _lastname.text,
                          "phoneNumber": _phoneNumber.text,
                          "birthday": _birthday.text,
                          "loveGroup": _loveGroup.text,
                          "zone": _zone.text,
                          "church": _church.text,
                          "branch": _branch.text,
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
