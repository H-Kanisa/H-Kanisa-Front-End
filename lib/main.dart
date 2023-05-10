import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'component/navigator/Navigator.dart';
import 'page/Common_Items/DataSheet Master/Register Member.dart';
import 'page/Login/LogInPage.dart';
import 'page/dashboard.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'H-Kanisa',
      initialRoute: Navigation.home,
      onGenerateRoute: Navigation.generateRoute,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Dashboard(),
    );
  }
}
