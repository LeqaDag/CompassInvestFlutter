import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(),
          home: Scaffold(
            // key: context.read<MenuController>().scaffoldKey,

            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("data")],
              ),
            ),
          ),
        ));
  }
}
