import 'dart:convert';

import 'package:binomage/flip_image.dart';
import 'package:realm/realm.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:binomage/flip_flop.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:binomage/home.dart';
import 'realm/assemble.dart';

class GameWidget extends StatefulWidget {
  final int id;
  const GameWidget({Key? key, required this.id}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final realmParrain = Realm(Configuration.local([Binom.schema, Parrains.schema, Filleuls.schema]));
    final realmFilleuls = Realm(Configuration.local([Binom.schema, Parrains.schema, Filleuls.schema]));
    int id = widget.id;
    final parrains = realmParrain.all<Parrains>();
    final filleuls = realmFilleuls.all<Filleuls>();
    final parrainsFiltre = parrains
        .where((parrain) => parrain.owner.any((binom) => binom.id == id))
        .toList();
    final filleulsFiltre = filleuls
        .where((filleul) => filleul.owner.any((binom) => binom.id == id))
        .toList();
    SwipeableCardSectionController cardController =
        SwipeableCardSectionController();
    // var genericProvider = Provider.of<GenericNotifier>(context);
    // List<List<dynamic>> mainList = genericProvider.bigList;
    List<FlipFlop Function()> flipFlop = [];

    List<Uint8List> photoParrains = [];
    List<Uint8List> photoFilleuls = [];

    for (var i = 0; i < parrainsFiltre.length; i++) {
      photoParrains.add(base64Decode(parrainsFiltre[i].image));
    }

    for (var i = 0; i < filleulsFiltre.length; i++) {
      photoFilleuls.add(base64Decode(filleulsFiltre[i].image));
    }

    photoParrains.shuffle();
    photoFilleuls.shuffle();

    Map<Uint8List, Uint8List> correspondances = {};
    int indexB = 0;
    for (var filleul in photoFilleuls) {
      correspondances[filleul] = photoParrains[indexB % photoParrains.length];
      indexB++;
    }

    correspondances.forEach((cle, valeur) {
      flipFlop.add(() => FlipFlop(
          imageP: FlipImage(image: valeur), imageF: FlipImage(image: cle)));
    });

    int length = flipFlop.length;

    return GestureDetector(
      onTap: () {
        print(photoFilleuls);
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A1352),
          automaticallyImplyLeading: false,
          title: AutoSizeText(
            'Binomo',
            style: FlutterFlowTheme.of(context).displayMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  letterSpacing: 7,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 8,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: Text(
                          'C\'est terminé !',
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF100C5A),
                                fontSize: 55,
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const HomePageWidget(),
                              ),
                            );
                          },
                          text: 'Retour au menu principal',
                          icon: const Icon(
                            Icons.keyboard_double_arrow_left,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            height: 40,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24, 0, 24, 0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 0),
                            color: const Color(0xFF100C5A),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 12,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FlutterFlowSwipeableStack(
                  itemCount: length,
                  topCardHeightFraction: 0.8,
                  middleCardHeightFraction: 0.7,
                  bottomCardHeightFraction: 0.6,
                  topCardWidthFraction: 0.9,
                  middleCardWidthFraction: 0.8,
                  bottomCardWidthFraction: 0.7,
                  controller: cardController,
                  enableSwipeUp: true,
                  enableSwipeDown: true,
                  onSwipeFn: (index) {},
                  onLeftSwipe: (index) {},
                  onRightSwipe: (index) {},
                  onUpSwipe: (index) {},
                  onDownSwipe: (index) {},
                  itemBuilder: (context, index) {
                    return flipFlop[index]();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
