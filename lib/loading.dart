import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF98B7CE),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Text(
                  'Binomo',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: 'Outfit',
                        color: const Color(0xFF100C5A),
                      ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Text(
                  'Chargement...',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                      ),
                ),
              ),
            ),],
        ),
      ),
    );
  }
}
