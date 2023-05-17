import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/form/CustomButton.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import '../../component/Form/FormTitle.dart';
import '../../component/appbars/BottomNav.dart';
import '../../style/pallete.dart';
import '../Setup_Page.dart';

//import '../pallete.dart';

class addZone extends StatefulWidget {
  @override
  State<addZone> createState() => _addZoneState();
}

class _addZoneState extends State<addZone> {
  final _formKey = GlobalKey<FormState>();
  final _Zone = TextEditingController();

  void _addZone() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('zones').add({
        
        'Zone': _Zone.text,
      });

      // Reset the form
      _formKey.currentState.reset();

      // Create a string with the form data
      String formData = 'Form submitted successfully\n'
          'Zone: ${_Zone.text}\n';

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
    _Zone.dispose();
    super.dispose();
  }

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
                        title: "Add Zone",
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Setup(),
                          ));
                        })),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormText(text: "Zone", controller: _Zone,),
                        FormButton(
                          text: 'Add',
                          action: _addZone
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}
