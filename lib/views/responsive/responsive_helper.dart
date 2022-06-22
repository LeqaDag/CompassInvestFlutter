import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  const ResponsiveWidget({Key? key, required this.mobile, required this.web})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 768) {
        return web;
      } else if (constraints.maxWidth < 768) {
        return mobile;
      } else {
        return Container();
      }
    });
  }
}
