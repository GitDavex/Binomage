import 'package:binomage/realm/assemble.dart';
import 'package:realm/realm.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:binomage/game.dart';
import 'package:binomage/loading.dart';
// import 'realm/assemble.dart';

class ListeBinomage extends StatefulWidget {
  final int index;
  final String ecole;
  final String filiere;
  final String cycle;
  final String anneeParrains;
  final String anneeFilleuls;

  const ListeBinomage({
    Key? key,
    required this.index,
    required this.ecole,
    required this.filiere,
    required this.cycle,
    required this.anneeParrains,
    required this.anneeFilleuls,
  }) : super(key: key);

  @override
  _ListeBinomageState createState() => _ListeBinomageState();
}

class _ListeBinomageState extends State<ListeBinomage> {
  @override
  Widget build(BuildContext context) {
    final realm = Realm(Configuration.local([Binom.schema]));
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 21,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        widget.ecole,
                        style: FlutterFlowTheme.of(context).headlineLarge,
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          const Color(0xFF0A1352)
                        ],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                      Text(
                        'Parrains:${widget.cycle} ${widget.filiere} ${widget.anneeParrains}',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                      Text(
                        'Filleuls:${widget.cycle} ${widget.filiere} ${widget.anneeFilleuls}',
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: FlutterFlowIconButton(
                          borderColor: const Color(0xFF1C2580),
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: const Color(0xFF1C2580),
                          hoverColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          hoverIconColor: const Color(0xFF1C2580),
                          icon: Icon(
                            Icons.edit_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: FlutterFlowIconButton(
                          borderColor: const Color(0xFF1C2580),
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 40,
                          fillColor: const Color(0xFF1C2580),
                          hoverColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          hoverIconColor: const Color(0xFF1C2580),
                          icon: Icon(
                            Icons.delete_outline,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24,
                          ),
                          onPressed: () {
                            int indexFinal = widget.index;
                            final binomage = realm.query<Binom>('id == $indexFinal)');
                            realm.write(() {
                              realm.delete(binomage[0]);
                            });
                            setState(() {
                              
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoadingWidget(),
                          ),
                        );

                        await Future.delayed(const Duration(seconds: 5));

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                GameWidget(id: widget.index),
                          ),
                        );
                      },
                      text: 'PLAY',
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color(0xFF1C4F80),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
