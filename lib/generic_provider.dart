import 'package:flutter/material.dart';

class GenericNotifier extends ChangeNotifier {
  final List<List<dynamic>> big = [];
  List<List<dynamic>> get bigList => big;

  final List<Widget> _binomage = [];
  List<Widget> get binomageList => _binomage;

  void addToMainList(List<dynamic> bigList) {
    big.add(bigList);
    notifyListeners();
  }

  void addBinomage(Widget newBinomage) {
    _binomage.add(newBinomage);
    notifyListeners();
  }
}
