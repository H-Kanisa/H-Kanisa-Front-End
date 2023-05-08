import 'package:flutter/material.dart';
import '../../style/pallete.dart';
import 'SignUpPage.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<Login> {
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
              gradient: LinearGradient(begin: Alignment.topCenter,
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                    Color.fromARGB(255, 121, 161, 40),
                    AppColor.greenHK,
                    Color.fromARGB(255, 222, 246, 174),
                  ]),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: AppColor.whiteHK,
                          fontSize: 50,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColor.whiteHK,
                        fontSize: 17,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)),
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(30),
                              child: Column(children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor.scaffoldColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  //Username
                                  child: Container(
                                    padding: EdgeInsets.all(10),

                                    child: TextField(
                                      style: TextStyle(
                                        color: AppColor.greyHK,
                                        fontSize: 15,
                                        fontFamily: "Poppins",
                                      ),
                                      cursorColor: AppColor.greenHK,
                                      decoration: InputDecoration(
                                          hintText: "User Name",
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w300,
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
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
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
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.grey),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          validator: (val) => val.length < 6
                                              ? 'Password too short.'
                                              : null,
                                          onSaved: (val) => _password = val,
                                          obscureText: _obscureText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //forgot password

                                Text(
                                  'Forgot Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: AppColor.redHK,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //Login button
                                Container(
                                  height: 50,
                                  width: 170,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
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
                                //Forgot password

                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Dont have an Account?  ",
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
                                                  builder: (context) =>
                                                      SignUp(),
                                                ));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ])))))
            ])));
  }
}
