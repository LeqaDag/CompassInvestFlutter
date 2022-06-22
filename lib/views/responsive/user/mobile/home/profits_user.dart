import 'package:compassinvest/models/trading_profit.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

import 'profit_card.dart';

class ProfitForUserSectionMobile extends StatelessWidget {
  final int uid;
  const ProfitForUserSectionMobile({Key? key, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TradingProfit tradingProfits = TradingProfit();

    return FutureBuilder(
        future: tradingProfits.getAllTrading(uid),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
              constraints: const BoxConstraints(maxWidth: 1110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExperienceCardMobile(numOfExp: (snapshot.data!).toString()),
                ],
              ),
            );
          }
        });
  }
}
