import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/Form/CustomButton.dart';
import 'package:responsive_dashboard/page/Dashboard/M-Pesa.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../../component/Form/FormText.dart';
import '../../component/appbars/NavBar2.dart';
import 'ConfirmPayment.dart';
import 'logic/paybill.dart';

class Tithe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TitheState();
}

class TitheState extends State<Tithe> {
  final _formKey = GlobalKey<FormState>();
  String _businessShortCode = "795194";
  String _passKey;
  String _amount;
  String _phoneNumber;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => MPesa())));
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: AppColor.blueHK),
      ),
      backgroundColor: AppColor.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**/ Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Pay Tithe",
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
                                Image.asset("assets/MPesaLogo.png",
                                    height: 100),
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
                            FormText(
                              text: 'Amount',
                           
                            ),
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
              onTap: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  makePayBillPayment(
                      _businessShortCode, _passKey, _amount, _phoneNumber);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
