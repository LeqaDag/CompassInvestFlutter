import 'package:compassinvest/models/rule.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/components/rules.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TradingRules tradingRulesData = TradingRules();

    return FutureBuilder<List>(
        future: tradingRulesData.getAllTradingRules(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        left: kDefaultPadding * 2,
                        right: kDefaultPadding * 2,
                        top: kDefaultPadding * 0.3,
                        bottom: kDefaultPadding * 0.2),
                    constraints: const BoxConstraints(maxWidth: 510),
                    child: Column(
                      children: [
                        RulesCard(
                          rule: snapshot.data![index]['rule'],
                          number: snapshot.data![index]['id'].toString(),
                        ),
                        const SizedBox(height: 2),
                      ],
                    ),
                  );
                });
          } else {
            return Container();
          }
        });

    // child: Container(
    //   margin: const EdgeInsets.only(
    //       left: kDefaultPadding * 2,
    //       right: kDefaultPadding * 2,
    //       top: kDefaultPadding * 5,
    //       bottom: kDefaultPadding * 2),
    //   constraints: const BoxConstraints(maxWidth: 510),
    //   child: Column(
    //     children: [
    //       const HeaderTextUser("  القوانين", 18, mainColor),
    //       RulesCard(
    //         rule: "الالتزام التام بالمواعيد",
    //         number: "1",
    //       ),
    //       const SizedBox(height: 15),
    //       RulesCard(
    //         rule: " مرونة بحضور جميع اللقاءات وجاهية او عبر الانترنت",
    //         number: "2",
    //       ),
    //       const SizedBox(height: 15),
    //       RulesCard(
    //         rule: "الالتزام بالصفقات داخل التداول وممنوع الخوض بصفقات خارجية",
    //         number: "3",
    //       ),
    //       const SizedBox(height: 15),
    //       RulesCard(
    //         rule: "عدم التصرف بالأرباح حتى الوصول الى الهدف المطلوب ",
    //         number: "4",
    //       ),
    //       const SizedBox(height: 15),
    //       RulesCard(
    //         rule: "تعبئة الارباح بعد كل صفقة",
    //         number: "5",
    //       ),
    //       const SizedBox(height: 15),
    //       RulesCard(
    //         rule: "منعا باتا مشاركة الضربات لاي شخص خارج المجموعة",
    //         number: "6",
    //       ),
    //       const SizedBox(height: 15),
    //     ],
    //   ),
    // ),
    // );
  }
}
