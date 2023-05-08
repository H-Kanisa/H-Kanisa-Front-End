import 'package:flutter/material.dart';
import '../../page/Common_Items/DataSheet Master/Register Member.dart';
import '../../page/Common_Items/DataSheet Master/View Members.dart';
import '../../page/Dashboard/M-Pesa.dart';
import '../../page/Dashboard/ManageUser.dart';
import '../../page/Onboarding/splash_view.dart';
import '../../page/dashboard.dart';

class Navigation {
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String registerMember = '/registerMember';
  static const String viewMember = '/viewMember';
  static const String manageUser = '/manageUser';
  static const String attendanceReport = '/attendanceReport';
  static const String settings = '/settings';
  static const String mPesa = '/mPesa';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case registerMember:
        return MaterialPageRoute(builder: (_) => regMember());
      case attendanceReport:
        return MaterialPageRoute(builder: (_) => SplashView());
      case viewMember:
        return MaterialPageRoute(builder: (_) => viewMembers());
      case manageUser:
        return MaterialPageRoute(builder: (_) => manageUsers());
      case mPesa:
        return MaterialPageRoute(builder: (_) => MPesa());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
