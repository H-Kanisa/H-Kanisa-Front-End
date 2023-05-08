import 'package:flutter/material.dart';
import '../../component/Form/CustomButton.dart';
import '../../style/pallete.dart';
import 'LogInPage.dart';

// ignore: prefer_const_constructors

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SignUp> {
  @override
  bool _obscureText = true;

  String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, //removes bottom overflow
        body: Container(
            width: double.infinity,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromARGB(255, 121, 161, 40),
                AppColor.greenHK,
                Color.fromARGB(255, 222, 246, 174),
              ]),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColor.whiteHK,
                            fontSize: 50,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteHK,

                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: AppColor.scaffoldColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //User Name
                            child: Container(
                              height: 45,
                              width: 420,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(),
                              child: TextField(
                                style: TextStyle(color: AppColor.greyHK),
                                cursorColor: AppColor.greenHK,
                                decoration: InputDecoration(
                                    hintText: "Email or User Name",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                            fontSize: 15,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w100,
                                            color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: AppColor.greenHK,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Password
                          Container(

                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: AppColor.scaffoldColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 45,
                                    width: 420,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                       ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          focusColor: AppColor.greenHK,
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.vpn_key,
                                            color: AppColor.greenHK,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: AppColor.greenHK,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                          ),
                                          hintText: "Password",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.grey)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              color: AppColor.scaffoldColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            //Password
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                     ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColor.greenHK,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                        hintText: "Confirm Password",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                                fontSize: 15,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w100,
                                                color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.vpn_key,
                                          color: AppColor.greenHK,
                                        )),
                                  ),
                                ),

                                //Password
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          //Sign Up button
                      Container(
                          height: 45,
                          width: 420,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColor.greenHK),
                        child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: AppColor.whiteHK,
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an Account?  ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Expanded(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: AppColor.redHK,
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      // Write Tap Code Here.
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ));
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ])));
  }
}
