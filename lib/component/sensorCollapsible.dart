import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SenserCollapsible extends ChangeNotifier {
  bool _isCollapsed = false;

  bool get isCollapsed => _isCollapsed;

  void toggleIsCollapsed() {
    _isCollapsed = !_isCollapsed;

    notifyListeners();
  }
}
