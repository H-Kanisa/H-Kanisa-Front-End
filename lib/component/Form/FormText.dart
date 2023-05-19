import 'package:flutter/material.dart';
import '../../style/pallete.dart';

class FormText extends StatefulWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  final IconData prefix;
  final IconData suffix;
  final VoidCallback onClicked;
  final String label;

  const FormText({
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
  State<FormText> createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  
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
        TextFormField(
          
          maxLines: 3,
          controller: widget.controller,
          cursorColor: AppColor.greenHK,
          minLines: 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${widget.text}';
            }
            return null;
          },
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColor.midGreyHk,
            fontWeight: FontWeight.w300,
          ),
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
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 7)),
      ],
    );
  }
}
