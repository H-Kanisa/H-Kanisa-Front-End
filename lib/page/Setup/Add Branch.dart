import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/form/CustomButton.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import '../../component/Form/FormOptions copy.dart';
import '../../component/Form/FormTitle.dart';
import '../../component/appbars/BottomNav.dart';
import '../../style/pallete.dart';
import '../Setup_Page.dart';

//import '../pallete.dart';

class addBranch extends StatefulWidget {
  @override
  State<addBranch> createState() => _addBranchState();
}

class _addBranchState extends State<addBranch> {
  final _formKey = GlobalKey<FormState>();
  final _Branch = TextEditingController();

  void _addBranch() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('branches').add({
        
        'Branch': _Branch.text,
      });

      // Reset the form
      _formKey.currentState.reset();

      // Create a string with the form data
      String formData = 'Form submitted successfully\n'
          'Branch: ${_Branch.text}\n';

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
    _Branch.dispose();
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
                        title: "Add Branch",
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
                        FormOption(text: "Branch", controller: _Branch,collection: 'branches',),
                        FormButton(
                          text: 'Add',
                          action: _addBranch
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
