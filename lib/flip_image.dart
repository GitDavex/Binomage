import 'package:flutter/material.dart';
import 'dart:typed_data';

class FlipImage extends StatefulWidget {
  final Uint8List image; // Changer le type de paramètre selon vos besoins

  const FlipImage({required this.image, Key? key}) : super(key: key);

  @override
  _FlipImageState createState() => _FlipImageState();
}

class _FlipImageState extends State<FlipImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.memory(
        widget.image,
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
