import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
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
  /*
 $first','$middle','$last','$phone','$birthday',
 '$cell','$zone','$church','$branch','$location');
  */
  final _formKey = GlobalKey<FormState>();

  String _firstName;
  String _middleName;
  String _lastName;
  String _phoneNumber;
  String _birthday;
  String _loveGroup;
  String _zone;
  String _church;
  String _branch;
  String _location;

  Future<void> _submitForm() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'h-kanisa',
    );

    final conn = await MySqlConnection.connect(settings);

    await conn.query(
      'INSERT INTO member_registration (FName, MName, LName, Phone_Number, DOB, Love_Group, Zone, Church, Branch, City) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        _firstName,
        _middleName,
        _lastName,
        _phoneNumber,
        _birthday,
        _loveGroup,
        _zone,
        _church,
        _branch,
        _location,
      ],
    );

    await conn.close();
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
                      })),
              SingleChildScrollView(
                child: Column(
                  children: [
                    FormText(text: "First Name"),
                    FormText(text: "Middle Name"),
                    FormText(text: "Last Name"),
                    FormText(text: "Phone Number"),
                    FormBirthday(text: "Birthday"),
                    FormDropDown(text: "Cell"),
                    FormDropDown(text: "Zone"),
                    FormDropDown(text: "Church"),
                    FormDropDown(text: "Branch"),
                    FormText(text: "Location"),
                    FormButton(
                        text: "Submit",
                        action: () {
                        _submitForm();
                        })
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
