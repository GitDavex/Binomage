import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:binomage/flip_image.dart';

class FlipFlop extends StatefulWidget {
  final FlipImage imageP;
  final FlipImage imageF;

  const FlipFlop({required this.imageP, required this.imageF, Key? key}) : super(key: key);

  @override
  _FlipFlopState createState() => _FlipFlopState();
}

class _FlipFlopState extends State<FlipFlop> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF0A1352),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            shape: BoxShape.rectangle,
          ),
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              'B',
              style: FlutterFlowTheme.of(context).displayLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 218,
                  ),
            ),
          ),
        ),
      ),
      back: Material(
        color: Colors.transparent,
        elevation: 34,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF98B7CE),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: const Color(0xFF0A1352),
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.transparent,
                elevation: 34,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.imageP
                  ],
                ),
              ),
              const Icon(
                Icons.expand_less_rounded,
                color: Color(0xFF1C1F80),
                size: 97,
              ),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.transparent,
                elevation: 34,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      widget.imageF,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
