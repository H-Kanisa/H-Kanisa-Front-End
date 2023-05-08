/*


import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/CustomButton.dart';
import 'package:responsive_dashboard/page/Dashboard/M-Pesa.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../../component/Form/FormText.dart';
import '../../component/appbars/NavBar2.dart';
import 'ConfirmPayment.dart';

class SpecialOffering extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SpecialOfferingState();
}

class SpecialOfferingState extends State<SpecialOffering> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => MPesa())));
        },icon: Icon(Icons.arrow_back_ios_rounded), color: AppColor.blueHK),
      ),
      backgroundColor: AppColor.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
/**/ Padding(
              padding: const EdgeInsets.all( 20.0),
              child: Text(
                "Special Offering",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColor.blueHK,
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: PhysicalModel(
                  color: AppColor.whiteHK,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 400,
                    width: 400,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),

                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/MPesaLogo.png", height: 100),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text(
                                        "Paybill",
                                        style: TextStyle(
                                          color: AppColor.midGreyHk,
                                          fontFamily: 'Poppins',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "795194",
                                        style: TextStyle(
                                          color: AppColor.midGreyHk,
                                          fontFamily: 'Poppins',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],

                              ),

                              FormText(text: 'Amount'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) => confirmPayment())));

              },
              child: Padding(
                padding: const EdgeInsets.all( 20.0),
                child: Container(
                  height: 50,
                  width: 400,
                  child: PhysicalModel(
                    color: AppColor.greenHK,
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Text(
                        "Pay",
                        style: TextStyle(
                          color: AppColor.whiteHK,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "GOD BLESS YOU AS YOU GIVE",
              style: TextStyle(
                color: AppColor.midGreyHk,
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),

    );
  }
}




*/


import 'package:flutter/material.dart';

class SpecialOffering extends StatefulWidget {
  @override
  _SpecialOfferingState createState() => _SpecialOfferingState();
}

class _SpecialOfferingState extends State<SpecialOffering> {
  final _formKey = GlobalKey<FormState>();
   String _businessShortCode;
   String _passKey;
   String _amount;
   String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Business Short Code'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a business short code';
                  }
                  return null;
                },
                onSaved: (value) {
                  _businessShortCode = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Pass Key'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a pass key';
                  }
                  return null;
                },
                onSaved: (value) {
                  _passKey = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Make Payment'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    makePayBillPayment(_businessShortCode, _passKey, _amount, _phoneNumber);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void makePayBillPayment(String businessShortCode, String passKey, String amount, String phoneNumber) {
  // your implementation here
}
