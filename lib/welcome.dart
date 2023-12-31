import 'package:flutter/material.dart';
import 'dart:async';
import 'package:binomage/home.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  _WelcomeWidgetState createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePageWidget(),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF100C5A),
          ),
          child: const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Text(
                'BINOMO',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Outfit',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              )),
        ),
      ),
    );
  }
}
