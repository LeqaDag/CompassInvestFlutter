import 'package:compassinvest/models/recommendation.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

import 'profit_card.dart';

class RecommendationProfitForUserSectionMobile extends StatelessWidget {
  final int uid;
  const RecommendationProfitForUserSectionMobile({Key? key, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Recommendation recommendationProfits = Recommendation();

    return FutureBuilder(
        future: recommendationProfits.getAllProfits(uid),
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
