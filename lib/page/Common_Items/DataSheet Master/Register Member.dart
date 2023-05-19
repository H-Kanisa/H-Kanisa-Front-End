import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/FormBirthday.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import 'package:responsive_dashboard/component/constants/List.dart';
import '../../../component/Form/CustomButton.dart';
import '../../../component/Form/FormOptions copy.dart';
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
  final _gender = TextEditingController();
  final _church = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _loveGroup = TextEditingController();
  final _branch = TextEditingController();
  final _department = TextEditingController();
  final _college = TextEditingController();
  final _birthday = TextEditingController();

  void _regMember() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('member_registration').add({
        // 'Code': 'ABC123',
        'Church': _church.text,
        'FName': _firstname.text,
        'MName': _middlename.text,
        'LName': _lastname.text,
        'Phone_Number': _phoneNumber.text,
        'DOB': DateTime.parse(_birthday.text),
        'Gender': _gender.text,
        'Department': _department.text,
        'Love_Group': _loveGroup.text,
        // 'College': _college.text,
        'Zone': _zone.text,
        'Branch': _branch.text,
        // 'address': '123 Example St',
        // 'Street': 'Example Street',
        // 'City': 'Example City',
        // 'State': 'Example State',
        // 'Country': 'Example Country',
        // 'Member_Level': 'Member',
        // 'Minister_in_Charge': 'Example Minister',
        // 'Active_Account': 'YES',
        // 'DateAdded': FieldValue.serverTimestamp(),
        // 'Added_By': 'Example User',
        // 'Date_Added': '2022-10-14',
        // 'Time_Added': '15:00:00',
        // 'Discharged': 'NO'
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
          'Department: ${_department}\n'
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
    _department.dispose();
    _birthday.dispose();
    _gender.dispose();
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
                      FormDropDown(
                        text: 'Gender',
                        controller: _gender,
                        list: genderItems,
                      ),
                      FormBirthday(
                        text: 'Birthday',
                        controller: _birthday,
                      ),
                      FormOption(
                        text: "Department",
                        controller: _department,
                        collection: 'departments',
                      ),
                      FormOption(
                        text: "Cell",
                        controller: _loveGroup,
                        collection: 'cells',
                      ),
                      FormOption(
                        text: "Zone",
                        controller: _zone,
                        collection: 'zones',
                      ),
                      FormOption(
                        text: "Church",
                        controller: _church,
                        collection: 'churches',
                      ),
                      FormOption(
                        text: "Branch",
                        controller: _branch,
                        collection: 'branches',
                      ),
                      // FormText(text: "Location"),
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
