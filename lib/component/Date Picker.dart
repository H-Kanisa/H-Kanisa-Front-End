import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../style/pallete.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {


  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 320,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    /*  return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('  '),
          // This button triggers the _showDatePicker function
        trailing: CupertinoButton(
          padding: EdgeInsetsDirectional.zero,
          child: const Text('Show Picker'),
          onPressed: () => _showDatePicker(context),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Text(_chosenDateTime != null
              ? _chosenDateTime.toString()
              : 'No date time picked!'),
        ),
      ),
    );*/
    return TextFormField(
      //  controller: _date,
      maxLines: 4,
      minLines: 1,
      style: TextStyle(
          fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_month_rounded),
        labelText: 'Date of Birth',
        hintText: 'Date of Birth',
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(12.0, 8.0, 28.0, 8.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: AppColor.midGreyHk,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColor.greenHK,
            width: 2.5,
          ),
        ),
      ),
      onTap: () => _showDatePicker(context),
    );
  }
}
