import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/FormBirthday.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';
import '../../../component/Form/CustomButton.dart';
import '../../../component/Form/FormOptions.dart';
import '../../../component/Form/FormTitle.dart';
import '../../../component/appbars/BottomNav.dart';
import '../../../style/pallete.dart';
import '../DataSheet_master.dart';

class regMember extends StatefulWidget {
  @override
  _regMemberState createState() => _regMemberState();
}

class _regMemberState extends State<regMember> {
  final _formKey = GlobalKey<FormState>();
  final _firstname = TextEditingController();
  final _middlename = TextEditingController();
  final _lastname = TextEditingController();
  final _zone = TextEditingController();
  final _church = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _loveGroup = TextEditingController();
  final _branch = TextEditingController();
  final _birthday = TextEditingController();

  void _regMember() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('members').add({
        'firstname': _firstname.text,
        'middlename': _middlename.text,
        'lastname': _lastname.text,
        'phoneNumber': _phoneNumber.text,
        'birthday': _birthday.text,
        'loveGroup': _loveGroup.text,
        'zone': _zone.text,
        'church': _church.text,
        'branch': _branch.text,
        'selectedCell': _loveGroup.text,
        'selectedZone': _zone.text,
        'selectedChurch': _church.text,
        'selectedBranch': _branch.text,
      });

      // Reset the form
      _formKey.currentState.reset();

      // Create a string with the form data
      String formData = 'Form submitted successfully\n'
          'First Name: ${_firstname.text}\n'
          'Middle Name: ${_middlename.text}\n'
          'Last Name: ${_lastname.text}\n'
          'Phone Number: ${_phoneNumber.text}\n'
          'Birthday: ${_birthday.text}\n'
          'Cell: ${_loveGroup.text}\n'
          'Zone: ${_zone.text}\n'
          'Church: ${_church.text}\n'
          'Branch: ${_branch.text}';

      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formData,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColor.greyHK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _firstname.dispose();
    _middlename.dispose();
    _lastname.dispose();
    _phoneNumber.dispose();
    _birthday.dispose();
    _loveGroup.dispose();
    _zone.dispose();
    _church.dispose();
    _branch.dispose();
    super.dispose();
  }

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
                child: Form(
                  key: _formKey,
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
                        action: _regMember,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
