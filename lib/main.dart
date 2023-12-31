import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome.dart';
// import 'loading.dart';
import 'package:binomage/chemin_fichier_provider.dart';
import 'package:binomage/list_provider.dart';
import 'package:binomage/chemin_fichier_provider_b.dart';
import 'package:binomage/list_provider_b.dart';
import 'package:binomage/generic_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePathNotifier>(
          create: (context) => ImagePathNotifier(),
        ),
        ChangeNotifierProvider<CListNotifier>(
          create: (context) => CListNotifier(),
        ),
        ChangeNotifierProvider<ImagePathNotifierB>(
          create: (context) => ImagePathNotifierB(),
        ),
        ChangeNotifierProvider<CListNotifierB>(
          create: (context) => CListNotifierB(),
        ),
        ChangeNotifierProvider<GenericNotifier>(
          create: (context) => GenericNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binomage',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const WelcomeWidget(),
      // home: const GameWidget(id: 0),
    );
  }
}
