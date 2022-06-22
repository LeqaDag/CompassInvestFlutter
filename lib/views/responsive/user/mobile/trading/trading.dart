// ignore_for_file: must_be_immutable

import 'package:compassinvest/models/trading_profit.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/trading_card.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'components/title_section.dart';

class TradingPageUsers extends StatefulWidget {
  TradingPageUsers({Key? key, required this.uid}) : super(key: key);
  late int uid;

  @override
  TradingPageUsersState createState() => TradingPageUsersState();
}

class TradingPageUsersState extends State<TradingPageUsers> {
  int colorCalender = 0xff17255A;
  int colorWeekly = 0xff17255A;
  int colorMonthly = 0xff5A5757;
  bool isWeekly = true;
  bool isMonthly = false;

  int colorTradingWeekly = 0xff189767;
  int colorTradingMonthly = 0xff5A5757;
  bool isWeeklyTrading = true;
  bool isMonthlyTrading = false;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    colorWeekly = 0xff17255A;
    colorMonthly = 0xff5A5757;
    isWeekly = true;
    isMonthly = false;

    colorTradingWeekly = 0xff189767;
    colorTradingMonthly = 0xff5A5757;
    isWeeklyTrading = true;
    isMonthlyTrading = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TradingProfit allProfits = TradingProfit();
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
            backgroundColor: const Color(0xffF8F8F8),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text("الطريق للـ 10k"),
              backgroundColor: mainColor,
              elevation: 0.0,
              centerTitle: true,
            ),
            body: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        right: width * 0.1,
                        top: width * 0.08,
                        bottom: width * 0.05),
                    child: HeaderTextUser(
                        "الأرباح للوصول للـ 10k", 18, Color(colorCalender))),
                Container(
                  margin:
                      EdgeInsets.only(bottom: width * 0.05, right: width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (!mounted) return;
                                setState(() {
                                  isWeeklyTrading = true;
                                  isMonthlyTrading = false;
                                  colorTradingWeekly = 0xff189767;
                                });
                              },
                              child: isWeeklyTrading == true
                                  ? HeaderTextUser("أسبوعيا  ", 18,
                                      Color(colorTradingWeekly))
                                  : HeaderTextUser("أسبوعيا  ", 15,
                                      Color(colorTradingMonthly))),
                          GestureDetector(
                              onTap: () {
                                if (!mounted) return;
                                setState(() {
                                  isMonthlyTrading = true;
                                  isWeeklyTrading = false;
                                  colorTradingMonthly = 0xff5A5757;
                                });
                              },
                              child: isMonthlyTrading == true
                                  ? HeaderTextUser(
                                      "شهريا  ", 18, Color(colorTradingWeekly))
                                  : HeaderTextUser("شهريا  ", 15,
                                      Color(colorTradingMonthly))),
                        ],
                      ),
                    ],
                  ),
                ),
                isWeeklyTrading == true
                    ? FutureBuilder<List>(
                        future:
                            allProfits.getAllWeeklyProfitsForUser(widget.uid),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SfCartesianChart(
                                tooltipBehavior: _tooltipBehavior,
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries>[
                                  ColumnSeries<ProfitData, String>(
                                      animationDuration: 4500,
                                      enableTooltip: true,
                                      dataSource: [
                                        for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++)
                                          ProfitData(
                                              snapshot.data![i]['date_created'],
                                              snapshot.data![i]['profit']
                                                  .toDouble()),
                                      ],
                                      xValueMapper: (ProfitData sales, _) =>
                                          sales.time,
                                      yValueMapper: (ProfitData sales, _) =>
                                          sales.profit,
                                      borderColor: const Color(0xffD5DFE5),
                                      color: const Color(0xff189767),
                                      borderWidth: 2,
                                      emptyPointSettings: EmptyPointSettings(
                                          mode: EmptyPointMode.average,
                                          color: Colors.red,
                                          borderColor: Colors.black,
                                          borderWidth: 2))
                                ]);
                          } else {
                            return Container();
                          }
                        })
                    : Container(),
                isMonthlyTrading == true
                    ? FutureBuilder<List>(
                        future:
                            allProfits.getAllMontlyProfitsForUser(widget.uid),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SfCartesianChart(
                                tooltipBehavior: _tooltipBehavior,
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries>[
                                  ColumnSeries<ProfitData, String>(
                                      animationDuration: 4500,
                                      enableTooltip: true,
                                      dataSource: [
                                        for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++)
                                          ProfitData(
                                              snapshot.data![i]['date_created'],
                                              snapshot.data![i]['profit']
                                                  .toDouble()),
                                      ],
                                      xValueMapper: (ProfitData sales, _) =>
                                          sales.time,
                                      yValueMapper: (ProfitData sales, _) =>
                                          sales.profit,
                                      borderColor: const Color(0xffD5DFE5),
                                      color: const Color(0xff189767),
                                      borderWidth: 2,
                                      emptyPointSettings: EmptyPointSettings(
                                          mode: EmptyPointMode.average,
                                          color: Colors.red,
                                          borderColor: Colors.black,
                                          borderWidth: 2))
                                ]);
                          } else {
                            return Container();
                          }
                        })
                    : Container(),
                Container(
                    margin: EdgeInsets.only(
                        bottom: width * 0.05,
                        right: width * 0.1,
                        top: width * 0.06),
                    child: const HeaderTextUser(
                        " القوانين", 18, Color(0xff17255A))),
                const TitleSection(),
                Container(
                    margin: EdgeInsets.only(
                        right: width * 0.1,
                        top: width * 0.08,
                        bottom: width * 0.05),
                    child: HeaderTextUser(
                        "عرض المواعيد  ", 18, Color(colorCalender))),
                Container(
                    constraints: const BoxConstraints(
                        minHeight: 250,
                        minWidth: double.infinity * 0.5,
                        maxHeight: double.infinity),
                    child: TradingCardMobile(
                      uid: widget.uid,
                    )),
              ],
            )));
  }
}

class ProfitData {
  ProfitData(this.time, this.profit);
  final String time;
  final double profit;
}
