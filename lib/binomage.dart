import 'package:binomage/generic_provider.dart';
import 'person_info_copy_widget.dart';
import 'person_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:binomage/list_provider.dart';
import 'package:binomage/list_provider_b.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import 'dart:typed_data';
import 'package:binomage/home.dart';
import 'package:realm/realm.dart';
import 'realm/assemble.dart';
import 'dart:math';
import 'dart:convert';

class AddBinomageWidget extends StatefulWidget {
  const AddBinomageWidget({Key? key}) : super(key: key);

  @override
  _AddBinomageWidgetState createState() => _AddBinomageWidgetState();
}

class _AddBinomageWidgetState extends State<AddBinomageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? ecole = 'ESI';
  String? cycle = 'TS';
  String? anneeParrains = '3';
  String? anneeFilleuls = '2';
  String? filiere = 'INFO';

  @override
  Widget build(BuildContext context) {
    final realm = Realm(Configuration.local([Binom.schema, Parrains.schema, Filleuls.schema]));
    var cListNotifier = Provider.of<CListNotifier>(context);
    var cListNotifierB = Provider.of<CListNotifierB>(context);
    var genericProvider = Provider.of<GenericNotifier>(context);
    List<dynamic> bigList = [];
    List<Widget> c = cListNotifier.cList;
    List<Widget> b = cListNotifierB.cList;
    List<Uint8List> imageParrains = cListNotifier.bList;
    List<Uint8List> imageFileuls = cListNotifierB.bList;

    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bigList.addAll([
              bigList.isNotEmpty ? bigList.length - 1 : 0,
              ecole,
              filiere,
              cycle,
              anneeParrains,
              anneeFilleuls,
              imageParrains,
              imageFileuls
            ]);
            final binomage = Binom(
                DateTime.now().millisecondsSinceEpoch + Random().nextInt(100),
                bigList[1],
                bigList[2],
                bigList[3],
                bigList[4],
                bigList[5]);
            realm.write(() {
              realm.add(binomage);
            });
            final binomReference = realm.all<Binom>().first;
            for (Uint8List parrains in imageParrains) {
              final parrainModel = Parrains(
                  DateTime.now().millisecondsSinceEpoch + Random().nextInt(100),
                  base64Encode(parrains));
            parrainModel.owner.add(binomReference);
              realm.write(() {
                realm.add(parrainModel);
              });
            }
            for (Uint8List filleuls in imageFileuls) {
              final filleulModel = Filleuls(
                  DateTime.now().millisecondsSinceEpoch + Random().nextInt(100),
                  base64Encode(filleuls));
                  filleulModel.owner.add(binomReference);
              realm.write(() {
                realm.add(filleulModel);
              });
            }
            genericProvider.addToMainList(bigList);
            print(bigList.length);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const HomePageWidget(),
              ),
            );
          },
          backgroundColor: const Color(0xFF1C2580),
          elevation: 12,
          child: Icon(
            Icons.checklist_sharp,
            color: FlutterFlowTheme.of(context).info,
            size: 24,
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A1352),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Text(
              'Binomo',
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    letterSpacing: 7,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 12,
        ),
        body: SafeArea(
            top: true,
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 40),
                            child: PageView(
                              controller: PageController(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Parrains',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                      const Color(0xFF1C2580),
                                                ),
                                          ),
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  showAlignedDialog(
                                                    barrierColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    isGlobal: true,
                                                    avoidOverflow: false,
                                                    targetAnchor:
                                                        const AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        const AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: GestureDetector(
                                                          child: SizedBox(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.6,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.8,
                                                            child: PersonInfoWidget(
                                                                cListNotifier),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                text: 'Ajouter',
                                                icon: const Icon(
                                                  Icons.add_rounded,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          24, 0, 24, 0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color:
                                                      const Color(0xFF1C2580),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 7,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF1C2580),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  hoverTextColor:
                                                      const Color(0xFF1C2580),
                                                  hoverElevation: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Consumer<CListNotifier>(
                                          builder: (context, cListNotifier, _) {
                                        // List<Widget> c = cListNotifier.cList;
                                        return GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: c,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Filleuls',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                      const Color(0xFF1C4F80),
                                                ),
                                          ),
                                          Builder(
                                            builder: (context) => Padding(
                                              padding: const EdgeInsets.all(3),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  showAlignedDialog(
                                                    barrierColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    isGlobal: true,
                                                    avoidOverflow: false,
                                                    targetAnchor:
                                                        const AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        const AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: GestureDetector(
                                                          child: SizedBox(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.6,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.8,
                                                            child: PersonInfoCopyWidget(
                                                                cListNotifierB),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                                text: 'Ajouter',
                                                icon: const Icon(
                                                  Icons.add_rounded,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40,
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          24, 0, 24, 0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color:
                                                      const Color(0xFF1C4F80),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 7,
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF1C4F80),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  hoverTextColor:
                                                      const Color(0xFF1C4F80),
                                                  hoverElevation: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Consumer<CListNotifierB>(builder:
                                          (context, cListNotifierB, _) {
                                        // List<Widget> b = cListNotifierB.cList;
                                        return GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 1,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: b,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        'RENSEIGNEMENTS',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: const Color(0xFF1C2580),
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: FlutterFlowDropDown(
                                          onChanged: (newValue) {
                                            // Mettre à jour la variable ecole lorsque l'option est modifiée
                                            setState(() {
                                              ecole = newValue;
                                            });
                                            // Vous pouvez également ajouter d'autres actions à effectuer lorsque l'option est modifiée
                                            // Par exemple, afficher la valeur sélectionnée : print(newValue);
                                          },
                                          options: const [
                                            'ESI',
                                            'ESCAE',
                                            'ESTP',
                                            'EPGE',
                                            'ESA',
                                            'ESPE'
                                          ],
                                          width: 300,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF1C2580),
                                                  ),
                                          hintText: 'Choisissez l\'école',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF1C2580),
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor: const Color(0xFF1C2580),
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: FlutterFlowDropDown(
                                          onChanged: (newValue) {
                                            setState(() {
                                              cycle = newValue;
                                            });
                                          },
                                          options: const [
                                            'TS',
                                            'ING',
                                          ],
                                          width: 300,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF1C2580),
                                                  ),
                                          hintText: 'Choisissez le cycle',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF1C2580),
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor: const Color(0xFF1C2580),
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: FlutterFlowDropDown(
                                          onChanged: (newValue) {
                                            setState(() {
                                              anneeParrains = newValue;
                                            });
                                          },
                                          options: const [
                                            '1',
                                            '2',
                                            '3',
                                          ],
                                          width: 300,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF1C2580),
                                                  ),
                                          hintText: 'Année des parrains',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF1C2580),
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor: const Color(0xFF1C2580),
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: FlutterFlowDropDown(
                                          onChanged: (newValue) {
                                            setState(() {
                                              anneeFilleuls = newValue;
                                            });
                                          },
                                          options: const [
                                            '1',
                                            '2',
                                            '3',
                                          ],
                                          width: 300,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF1C2580),
                                                  ),
                                          hintText: 'Année des filleuls',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF1C2580),
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor: const Color(0xFF1C2580),
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: FlutterFlowDropDown(
                                          onChanged: (newValue) {
                                            setState(() {
                                              filiere = newValue;
                                            });
                                          },
                                          options: const [
                                            'INFO',
                                            'EIT',
                                            'EAI',
                                            'MA',
                                            'BCPST',
                                            'MPSI',
                                            'CAE'
                                          ],
                                          width: 300,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        const Color(0xFF1C2580),
                                                  ),
                                          hintText: 'Choisissez la filière',
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF1C2580),
                                            size: 24,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2,
                                          borderColor: const Color(0xFF1C2580),
                                          borderWidth: 2,
                                          borderRadius: 8,
                                          margin: const EdgeInsetsDirectional
                                              .fromSTEB(16, 4, 16, 4),
                                          hidesUnderline: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 0, 16),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: null,
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3,
                                  spacing: 8,
                                  radius: 16,
                                  dotWidth: 16,
                                  dotHeight: 8,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
