import 'package:flutter/material.dart';

class AboutTextWithSignMobile extends StatelessWidget {
  const AboutTextWithSignMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "أرباحك \nمن التداول بدبي",
          style: TextStyle( color: Colors.black, fontSize: 22),
        ),
      ],
    );
  }
}

