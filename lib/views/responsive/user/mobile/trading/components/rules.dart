// ignore_for_file: must_be_immutable
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
  RulesCard({Key? key, required this.rule, required this.number})
      : super(key: key);
  String rule;
  String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      constraints: const BoxConstraints(maxWidth: 1110),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 28, color: Color(0xFFCBA135)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 70,
              child: VerticalDivider(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rule,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.black87),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
