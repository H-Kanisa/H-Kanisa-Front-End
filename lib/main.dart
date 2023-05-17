
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/dashboard.dart';
import 'component/navigator/Navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
   FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
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
