import 'package:flutter/material.dart';
import 'dart:typed_data';

class CListNotifier extends ChangeNotifier {
  final List<Widget> _c = [];
  List<Widget> get cList => _c;

  final List<Uint8List> _b = [];
  List<Uint8List> get bList => _b;

  void addToC(Widget newWidget) {
    _c.add(newWidget);
    notifyListeners();
  }

  void share(Uint8List image) {
    _b.add(image);
    notifyListeners();
  }
}
