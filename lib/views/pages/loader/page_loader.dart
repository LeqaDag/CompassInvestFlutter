// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:compassinvest/views/pages/welcom_page.dart';
import 'package:flutter/material.dart';

import '../maintenance.dart';

class PageLoader extends StatefulWidget {
  int? closeApp;
  PageLoader({Key? key, required this.closeApp}) : super(key: key);

  @override
  _PageLoaderState createState() => _PageLoaderState();
}

// ignore: non_constant_identifier_names
class _PageLoaderState extends State<PageLoader> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.closeApp);
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    if (widget.closeApp == 0) {
      return Timer(duration, welcomeRoute);
    } else {
      return Timer(duration, maintainceRoute);
    }
  }

  welcomeRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  maintainceRoute() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const MaintenancePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo.png"),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const Text(
              "Compass Invest",
              style: TextStyle(fontSize: 20.0, color: Color(0xff010E1F)),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
