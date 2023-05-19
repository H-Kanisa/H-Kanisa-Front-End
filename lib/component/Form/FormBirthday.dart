import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/pallete.dart';

class FormBirthday extends StatefulWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final IconData prefix;
  final IconData suffix;
  final VoidCallback onClicked;
  final String label;

  const FormBirthday({
    Key key,
    this.text,
    this.hint,
    this.controller,
    this.prefix,
    this.suffix,
    this.onClicked,
    this.label,
  }) : super(key: key);

  @override
  State<FormBirthday> createState() => _FormBirthdayState();
}

class _FormBirthdayState extends State<FormBirthday> {
  DateTime selectedDate;

  Future<void> showDatePicker(BuildContext context) async {
    final newDateTime = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white.withOpacity(0.9),
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    final monthDay = DateTime(
                      DateTime.now().year,
                      newDateTime.month,
                      newDateTime.day,
                    );
                    setState(() {
                      selectedDate = monthDay;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text('Save'),
                onPressed: () async {
                  if (selectedDate != null) {
                    final formattedDate =
                        selectedDate.toIso8601String().substring(0, 10);
                    widget.controller.text = formattedDate;

                    // Save the selected date to Firestore
                    await FirebaseFirestore.instance
                        .collection('your_collection_name')
                        .add({
                      'Date': selectedDate,
                    });
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );

    if (newDateTime != null) {
      final monthDay = DateTime(
        DateTime.now().year,
        newDateTime.month,
        newDateTime.day,
      );
      setState(() {
        selectedDate = monthDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(context);
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.text,
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
          TextFormField(
            maxLines: 3,
            minLines: 1,
            cursorColor: AppColor.greenHK,
            readOnly: true,
            onTap: () {
              showDatePicker(context);
            },
            decoration: InputDecoration(
              hintText: "Enter ${widget.text}",
              hintStyle: TextStyle(
                fontSize: 14,
                color: AppColor.offWhiteHK,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w100,
              ),
              focusColor: AppColor.midGreyHk,
              suffixIcon: Icon(widget.suffix, color: AppColor.midGreyHk),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              fillColor: Color.fromARGB(64, 236, 236, 236),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColor.greenHK,
                  width: 2,
                ),
              ),
            ),
            controller: widget.controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${widget.text}';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
