import 'package:flutter/material.dart';
import '../../style/pallete.dart';

class FormDropDown extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String hint;
  final IconData prefix;
  final List<String> list;
  final VoidCallback onClicked;

  const FormDropDown({
    Key key,
    @required this.text,
    @required this.controller,
    @required this.hint,
    @required this.prefix,
    @required this.list,
    @required this.onClicked, String label,
  }) : super(key: key);

  @override
  _FormDropDownState createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  String _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        DropdownButtonFormField<String>(
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColor.midGreyHk,
            fontWeight: FontWeight.w300,
          ),
          decoration: InputDecoration(
            isDense: true,
            hintText: " Select ${widget.text}",
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
            contentPadding: EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 10),
          ),
          isExpanded: true,
          iconSize: 30,
          iconEnabledColor: AppColor.midGreyHk,
          value: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
              widget.controller.text = value;
            });
            if (widget.onClicked != null) {
              widget.onClicked();
            }
          },
          items: widget.list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                        color: AppColor.midGreyHk,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a value';
            }
            return null;
          },
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
      ],
    );
  }
}
