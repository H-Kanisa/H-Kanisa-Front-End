import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/form/CustomButton.dart';
import 'package:responsive_dashboard/component/Form/FormText.dart';
import '../../component/Form/FormTitle.dart';
import '../../component/appbars/BottomNav.dart';
import '../../style/pallete.dart';
import '../Setup_Page.dart';

//import '../pallete.dart';

class addCell extends StatefulWidget {
  @override
  State<addCell> createState() => _addCellState();
}

class _addCellState extends State<addCell> {
  final _formKey = GlobalKey<FormState>();
  final _Cell = TextEditingController();
  TextEditingController _zone = TextEditingController();
  TextEditingController _cell = TextEditingController();
  String _selectedZone;
  Future<List<String>> _fetchZones() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('zones').get();
    final zones = querySnapshot.docs.map((doc) {
      final data = doc.data();
      if (data.containsKey('Zone')) {
        return data['Zone'] as String;
      } else {
        // Handle the case when the 'Zone' field is missing
        return 'N/A';
      }
    }).toList();
    return zones;
  }

  
  @override
  void dispose() {
    _zone.dispose();
    super.dispose();
  }

  //Function to add cell
  void _addCell() async {
    if (_formKey.currentState.validate()) {
      // Save the form data to Firestore
      await FirebaseFirestore.instance.collection('cells').add({
        'Cell': _Cell.text,
        'Zone': _zone.text,
      });

      // Reset the form
      _formKey.currentState.reset();

      // Create a string with the form data
      String formData = 'Form submitted successfully\n'
          'Cell: ${_Cell.text}\n';

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
                        title: "Add Cell",
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
                        FormText(
                          text: "Cell",
                          controller: _Cell,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Zone',
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.greyHK,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                        FutureBuilder<List<String>>(
                          future: _fetchZones(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              final zones = snapshot.data;
                              return DropdownButtonFormField<String>(
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  color: AppColor.midGreyHk,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Select Zone",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.offWhiteHK,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w100,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: AppColor.greenHK,
                                      width: 2,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color.fromARGB(64, 236, 236, 236),
                                  contentPadding: EdgeInsets.only(
                                      left: 10, right: 0, top: 10, bottom: 10),
                                ),
                                isExpanded: true,
                                iconSize: 30,
                                iconEnabledColor: AppColor.midGreyHk,
                                value: _selectedZone,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedZone = value;
                                  });
                                },
                                items: zones.map((zone) {
                                  return DropdownMenuItem<String>(
                                    value: zone,
                                    child: Text(zone),
                                  );
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a value';
                                  }
                                  return null;
                                },
                              );
                            }
                          },
                        ),
                        FormButton(text: 'Add', action: _addCell)
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
