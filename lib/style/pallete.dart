import 'package:flutter/material.dart';

class AppColor {
  static const TextStyle styleHK = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 22,
      color: Color.fromARGB(255, 255, 255, 255));
  static MaterialColor colorHK = MaterialColor(
    0xFF94C13D,
    const <int, Color>{
      50: const Color(0xFF94C13D),
      100: const Color(0xFF94C13D),
      200: const Color(0xFF94C13D),
      300: const Color(0xFF94C13D),
      400: const Color(0xFF94C13D),
      500: const Color(0xFF94C13D),
      600: const Color(0xFF94C13D),
      700: const Color(0xFF94C13D),
      800: const Color(0xFF94C13D),
      900: const Color(0xFF94C13D),
    },
  );

  static const Color BACK_GROUND_COLOR = Color(0xFF94C13D);
  static const Color whiteHK = Color.fromRGBO(255, 255, 255, 1);
  static const Color greenHK = Color(0xFF94C13D);
  static const Color blueHK = Color.fromRGBO(58, 63, 149, 1);
  static const Color greyHK = Color(0xFF4C4C4C);
  static const Color redHK = Color(0xFFE9232A);
  static const Color greenSubtleHK =Color(0xFFDDFF9A);
  static Color get blueSubtleHK => Colors.blue.shade50;
  static const Color greySubtleHK =Color(0xFF4C4C4C);
  static const Color redSubtleHK = Color.fromARGB(19, 233, 35, 42);
  static const Color offWhiteHK = Color.fromARGB(255, 189, 189, 189);
  static const Color midGreyHk = Color(0xFF808080);
  static const Color scaffoldColor = Color.fromARGB(255, 242, 242, 242);
  static const Color textGreyHK = Color(0xFF4C4C4C);
  static const Color lightGreyHk = Color(0xFFEAEAEA);
}
