// ignore_for_file: prefer_const_constructors

import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';

import '../intro.dart';

// ignore: must_be_immutable
class NonActiveUserHomePage extends StatefulWidget {
  String fname;
  String lname;
  NonActiveUserHomePage({Key? key, required this.fname, required this.lname})
      : super(key: key);

  @override
  State<NonActiveUserHomePage> createState() => _NonActiveUserHomePageState();
}

class _NonActiveUserHomePageState extends State<NonActiveUserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeaderTextUser(
              " ${widget.fname} ${widget.lname} اهلا", 18, Color(0xff17255A)),
          HeaderTextUser(
              "سوف يصلك ايميل قريبا للدخول للتطبيق", 17, Colors.black),
          IntroPage()
        ],
      ),
    );
  }
}
