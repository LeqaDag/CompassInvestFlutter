// ignore_for_file: must_be_immutable

import 'package:compassinvest/models/trade.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/all_profits.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TradingCardMobile extends StatefulWidget {
  TradingCardMobile({Key? key, required this.uid}) : super(key: key);
  int uid;
  @override
  _TradingCardMobileState createState() => _TradingCardMobileState();
}

class _TradingCardMobileState extends State<TradingCardMobile> {
  Trading tradingData = Trading();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder<List>(
        future: tradingData.getAllTrading(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  DateTime todayDate =
                      DateTime.parse(snapshot.data![index]["date"]);

                  return Container(
                      height: 120.0,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.1),
                      margin: EdgeInsets.only(right: width * 0.03),
                      constraints: const BoxConstraints(maxWidth: 510),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: width * 0.2,
                            alignment: FractionalOffset.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeaderTextUser(
                                    DateFormat('dd-MM')
                                        .format(todayDate)
                                        .toString(),
                                    12,
                                    Colors.black),
                                HeaderTextUser(
                                    DateFormat('yyyy')
                                        .format(todayDate)
                                        .toString(),
                                    14,
                                    const Color(0xFFCBA135)),
                                snapshot.data![index]['type'] == 0
                                    ? TradingLink(
                                        iconSrc: "assets/images/zoom.png",
                                        press: () async {
                                          var url = snapshot.data![index]
                                                  ['link']
                                              .toString();
                                          if (await canLaunch(url)) {
                                            await launch(
                                              url,
                                              universalLinksOnly: true,
                                            );
                                          }
                                        },
                                      )
                                    : TradingLink(
                                        iconSrc: "assets/images/meet.png",
                                        press: () {},
                                      )
                              ],
                            ),
                          ),
                          Container(
                            height: 300.0,
                            width: width * 0.7,
                            decoration: BoxDecoration(
                              color: const Color(0xff17255A),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 10.0),
                                ),
                              ],
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  HeaderTextUser(
                                      snapshot.data![index]['location'] ?? "",
                                      13,
                                      Colors.white),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.timelapse,
                                        color: Colors.white30,
                                      ),
                                      Text(
                                        DateFormat('  hh:mm a')
                                            .format(todayDate)
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white30,
                                            fontSize: 10),
                                      ),
                                      Text(
                                        DateFormat(':  hh:mm a')
                                            .format(todayDate
                                                .add(const Duration(hours: 2)))
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white30,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              onPrimary: mainColor,
                                              primary: const Color(0xffF8F8F8)),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AllTradingProfitsUser(
                                                        trading_id: snapshot
                                                            .data![index]['id'],
                                                        uid: widget.uid,
                                                      )),
                                            );
                                          },
                                          child: const Text('جميع الارباح')),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                });
          } else {
            return Container();
          }
        });
  }
}
