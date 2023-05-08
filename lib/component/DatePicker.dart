/* Widget Date {
    return CupertinoPageScaffold(
      child : Center(
        child: const Text('Date of Birth'),
        onPressed: () {
          showCupertinoModalPopup(context: context, builder: (BuildContext context)=> SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              initialDateTime: dateTime,
              onDateTimeChanged: (DateTime newTime) {
                setState(() => dateTime= newTime);    
               
                         },
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.date,
            ),
          ));
        })
         );
    
    
  }  */
