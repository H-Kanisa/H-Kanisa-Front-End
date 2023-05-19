import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../style/pallete.dart';

class FormOption extends StatefulWidget {
  final String text; // Text label for the dropdown field
  final String selectedItem; // Initially selected item for the dropdown field
  final TextEditingController controller; // Controller to manage the selected value
  final String hint; // Hint text for the dropdown field
  final String collection; // Firestore collection to fetch data from

  final IconData prefix; // Prefix icon for the dropdown field
  final List<String> list; // List of items for the dropdown field
  final VoidCallback onClicked; // Callback function when the dropdown is clicked

  const FormOption({
    Key key,
    @required this.text,
    @required this.controller,
    @required this.hint,
    @required this.prefix,
    @required this.collection,
    @required this.selectedItem,
    @required this.list,
    @required this.onClicked,
    String label,
  }) : super(key: key);

  @override
  _FormOptionState createState() => _FormOptionState();
}

class _FormOptionState extends State<FormOption> {
  String _selectedItem; // Currently selected item in the dropdown field

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem; // Set the initial selected item
  }

  Future<List<String>> _fetchItems() async {
    // Fetch items from the Firestore collection
    final querySnapshot =
        await FirebaseFirestore.instance.collection(widget.collection).get();
    final data = querySnapshot.docs.map((doc) {
      final data = doc.data();
      if (data.containsKey(widget.text)) {
        return data[widget.text] as String;
      } else {
        return 'N/A';
      }
    }).toList();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text, // Display the label for the dropdown field
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
          future: _fetchItems(), // Fetch the list of items
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for data, display a loading indicator
              return Container(
                height: 20,
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CircularProgressIndicator(
                    color: AppColor.whiteHK,
                    backgroundColor: AppColor.greenHK,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              // If an error occurs while fetching data, display the error message
              return Text('Error: ${snapshot.error}');
            } else {
              final data = snapshot.data; // Retrieved data from Firestore
              return DropdownButtonFormField<String>(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: AppColor.midGreyHk,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  // Styling for the dropdown field
                  isDense: true,
                  hintText: _selectedItem ?? "Select ${widget.text}",
                  // Display the selected item or default hint text
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
                    left: 10,
                    right: 0,
                    top: 10,
                    bottom: 10,
                  ),
                ),
                isExpanded: true,
                iconSize: 30,
                iconEnabledColor: AppColor.midGreyHk,
                value: _selectedItem, // Set the selected item in the dropdown
                onChanged: (value) {
                  // When a new item is selected, update the state and controller value
                  setState(() {
                    _selectedItem = value;
                    widget.controller.text = value;
                  });
                },
                items: data.map((dataItem) {
                  // Generate dropdown items from the retrieved data
                  return DropdownMenuItem<String>(
                    value: dataItem,
                    child: Text(dataItem),
                  );
                }).toList(),
                validator: (value) {
                  // Validate that a value is selected
                  if (value == null || value.isEmpty) {
                    return 'Please select a value';
                  }
                  return null;
                },
              );
            }
          },
        ),
      ],
    );
  }
}