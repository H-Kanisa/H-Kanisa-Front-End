import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'component/navigator/Navigator.dart';
import 'page/Admin/Adjust Reports/Cell Attendance.dart';
import 'page/Common_Items/DataSheet Master/Register Child.dart';
import 'page/Common_Items/DataSheet Master/Register Member.dart';
import 'page/Common_Items/DataSheet Master/View Members.dart';
import 'page/Dashboard/ManageUser.dart';
import 'page/Onboarding/splash_view.dart';
import 'page/Onboarding/welcome_view.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Image.asset("assets/H-Main.png");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'H-Kanisa',
      initialRoute: Navigation.home,
      onGenerateRoute: Navigation.generateRoute,
      
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Dashboard(),
      //  routes: {
      //   '/dashboard': (context) => Dashboard(),
      //   '/registerMember': (context) => regMember(),
      //   '/attendanceReport': (context) => CellAttendance(),
      //   '/viewMember': (context) => viewMembers(),
      //   '/manageUser': (context) => manageUsers(),
      // },
    );
  }
}
