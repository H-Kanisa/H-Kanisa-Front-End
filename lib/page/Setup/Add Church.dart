import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/form/CustomButton.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import '../../component/Form/FormTitle.dart';
import '../../component/appbars/BottomNav.dart';
import '../../style/pallete.dart';
import '../Setup_Page.dart';

//import '../pallete.dart';

class addChurch extends StatefulWidget {
  @override
  State<addChurch> createState() => _addChurchState();
}

class _addChurchState extends State<addChurch> {
  final _formKey = GlobalKey<FormState>();
  final _church = TextEditingController();

  void _addChurch() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('churches').add({
        
        'Church': _church.text,
      });

      // Reset the form
      _formKey.currentState.reset();

      // Create a string with the form data
      String formData = 'Form submitted successfully\n'
          'Church: ${_church.text}\n';

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
    _church.dispose();
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
                        title: "Add Church",
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
                        FormText(text: "Church", controller: _church,),
                        FormButton(
                          text: 'Add',
                          action: _addChurch
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
