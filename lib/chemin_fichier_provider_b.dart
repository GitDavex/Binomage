import 'package:flutter/material.dart';
import 'dart:typed_data';

class ImagePathNotifierB extends ChangeNotifier {
  late Uint8List _imagePath = Uint8List(1);

  Uint8List get imagePath => _imagePath;

  void updateImagePath(Uint8List newPath) {
    _imagePath = newPath;
    notifyListeners();
  }
}
