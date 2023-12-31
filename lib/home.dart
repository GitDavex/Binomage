import 'package:binomage/list_binomage.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'binomage.dart';
import 'package:realm/realm.dart';
import 'realm/assemble.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // var genericProvider = Provider.of<GenericNotifier>(context);
    // List<List<dynamic>> mainList = genericProvider.bigList;
    // List<Widget> binomage = genericProvider.binomageList;
    final realm = Realm(Configuration.local([Binom.schema]));
    final binomages = realm.all<Binom>();
    List<Widget> listBinomage = [];
    for (int i = 0; i < binomages.length; i++) {
      listBinomage.add(ListeBinomage(
          index: binomages[i].id,
          ecole: binomages[i].ecole,
          filiere: binomages[i].filiere,
          cycle: binomages[i].cycle,
          anneeParrains: binomages[i].anneeParrains,
          anneeFilleuls: binomages[i].anneeFilleuls));
    }

    return GestureDetector(
      // onTap: () {
      //   for (int i = 0; i < binomages.length; i++) {
      //     var binomage = binomages[i];
      //     print(binomage.ecole);
      //   }
      // },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0x36187BFB),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const AddBinomageWidget(),
              ),
            );
          },
          backgroundColor: const Color(0xFF1C2580),
          elevation: 8,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).info,
            size: 24,
          ),
        ),
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF98B7CE),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, -1),
                          child: Text(
                            'Mes binomages',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF1C2580),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (Widget widgetBinomage in listBinomage) widgetBinomage
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
