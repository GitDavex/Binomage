import 'package:flutter/material.dart';
import 'dart:typed_data';

// import 'package:image_picker/image_picker.dart';

class CardParrain extends StatefulWidget {
  final Uint8List imagePath; // Ajoutez la propriété imagePath

  const CardParrain({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<CardParrain> createState() => _CardParrainState();
}

class _CardParrainState extends State<CardParrain> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer, 
        color: const Color(0xFF98A1CE),
        elevation: 21,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            widget.imagePath,
            width: 300,
            height: 200, 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}