// ignore_for_file: prefer_const_constructors, prefer_is_empty, unnecessary_new, must_be_immutable, non_constant_identifier_names
import 'package:compassinvest/models/trading_profit.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/edit_profit.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/share_profit.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllTradingProfitsUser extends StatefulWidget {
  int trading_id;
  int uid;
  AllTradingProfitsUser({
    Key? key,
    required this.trading_id,
    required this.uid,
  }) : super(key: key);

  @override
  _AllTradingProfitsUserState createState() => _AllTradingProfitsUserState();
}

class _AllTradingProfitsUserState extends State<AllTradingProfitsUser> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    TradingProfit allProfits = TradingProfit();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Color(0xffF8F8F8),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text("جميع الأرباح"),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              automaticallyImplyLeading: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Color(0xff189767),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareTradingProfit(
                            trading_id: widget.trading_id,
                            uid: widget.uid,
                          ),
                        ));
                  },
                )
              ],
            ),
            body: FutureBuilder<List>(
                future: allProfits.getAllTradingForUser(
                    widget.uid, widget.trading_id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SafeArea(
                        child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white54),
                                    height: height * 0.2,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                        left: width * 0.03,
                                        top: width * 0.02,
                                        right: width * 0.03),
                                    padding: EdgeInsets.only(
                                        left: width * 0.02,
                                        right: width * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            snapshot.data![index]['logo_url']
                                                    .toString()
                                                    .contains(".svg")
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.network(
                                                      snapshot.data![index]
                                                              ['logo_url']
                                                          .toString(),
                                                      height: 40.0,
                                                      width: 40.0,
                                                    ))
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      snapshot.data![index]
                                                              ['logo_url']
                                                          .toString(),
                                                      height: 40.0,
                                                      width: 40.0,
                                                    ),
                                                  ),
                                            Container(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              snapshot.data![index]['symbol']
                                                  .toString()
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            snapshot.data![index]['profit'] > 0
                                                ? Text(
                                                    snapshot.data![index]
                                                                ['profit']
                                                            .toString() +
                                                        "\$",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: greenColor),
                                                  )
                                                : Text(
                                                    snapshot.data![index]
                                                                ['profit']
                                                            .toString() +
                                                        "\$",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: credColor),
                                                  ),
                                            InkWell(
                                              onTap: () {
                                                
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditTradingProfit(
                                                              id: snapshot
                                                                      .data![
                                                                  index]['id']),
                                                    ));
                                              },
                                              child: Icon(Icons.edit,
                                                  color: Color(0xff189767)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              }),
                        ],
                      ),
                    ));
                  } else {
                    return Container();
                  }
                })));
  }
}
