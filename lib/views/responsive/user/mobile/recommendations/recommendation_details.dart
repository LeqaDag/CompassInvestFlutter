// ignore_for_file: non_constant_identifier_names, prefer_const_constructors
import 'package:compassinvest/models/recommendation.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'share_recommendation_profit.dart';

// ignore: must_be_immutable
class RecommendationDetails extends StatefulWidget {
  int recommendation_id;
  int uid;
  RecommendationDetails(
      {Key? key, required this.recommendation_id, required this.uid})
      : super(key: key);

  @override
  _RecommendationDetailsState createState() => _RecommendationDetailsState();
}

class _RecommendationDetailsState extends State<RecommendationDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String typeCrypto = "SHORT";
    int color = 0xffDE0016;
    Recommendation recommendationData = Recommendation();

    return FutureBuilder<List>(
        future:
            recommendationData.getRecommendationById(widget.recommendation_id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data![0]["type"] == 1) {
              typeCrypto = "LONG";
              color = 0xff40A421;
            } else {
              typeCrypto = "SHORT";
              color = 0xffDE0016;
            }

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: const Color(0xff17255A),
                    elevation: 0.0,
                    title: Text(snapshot.data![0]["crypto_name"]),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          height: height * 0.35,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xff17255A),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(color: Colors.black54, blurRadius: 10.0)
                            ],
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 50.0)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  _simplePopup("hi", "1", width, height),
                                  Row(
                                    children: [
                                      HeaderTextUser(
                                          typeCrypto, 18, Color(color)),
                                      snapshot.data![0]["image"]
                                              .toString()
                                              .contains(".svg")
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.network(
                                                snapshot.data![0]["image"],
                                                height: 30.0,
                                                width: 30.0,
                                              ))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                snapshot.data![0]["image"],
                                                height: 30.0,
                                                width: 30.0,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: height * 0.25,
                                    width: width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: NetworkImage(snapshot.data![0]
                                          ["graph_image_path"]),
                                      fit: BoxFit.fill,
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(width * 0.04),
                            child: const HeaderTextUser(
                                "نقاط الدخول", 18, Color(0xff17255A))),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.1),
                          child: FutureBuilder<List>(
                            future: recommendationData
                                .getEntryPointsById(widget.recommendation_id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Color(0xff17255A),
                                                size: 18,
                                              ),
                                              HeaderTextUser(
                                                  snapshot.data![index]
                                                          ["entry_point"]
                                                      .toString(),
                                                  16,
                                                  Colors.black),
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                return const Text(
                                  "0",
                                  style: TextStyle(color: Colors.black),
                                );
                              }
                            },
                            initialData: const [],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(width * 0.04),
                            child: const HeaderTextUser(
                                "نقاط هدف", 18, Color(0xff40A421))),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.1),
                          child: FutureBuilder<List>(
                            future: recommendationData
                                .getTargetPointsById(widget.recommendation_id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                color: Color(0xff17255A),
                                                size: 18,
                                              ),
                                              HeaderTextUser(
                                                  snapshot.data![index]
                                                          ["target_point"]
                                                      .toString(),
                                                  16,
                                                  Colors.black),
                                            ],
                                          )
                                        ],
                                      );
                                    });
                              } else {
                                return const Text(
                                  "0",
                                  style: TextStyle(color: Colors.black),
                                );
                              }
                            },
                            initialData: const [],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(width * 0.04),
                            child: const HeaderTextUser(
                                "نقاط خروج", 18, Color(0xffDE0016))),
                        Container(
                            margin: EdgeInsets.only(right: width * 0.1),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Color(0xffDE0016),
                                  size: 18,
                                ),
                                HeaderTextUser(
                                    snapshot.data![0]["exit_point"].toString(),
                                    16,
                                    Colors.black),
                              ],
                            )),
                        Container(
                            width: double.infinity,
                            height: height * 0.06,
                            margin: EdgeInsets.only(top: width * 0.1),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffD5DFE5),
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShareRecommendationProfit(
                                            recommendation_id: snapshot.data![0]
                                                ["id"],
                                            name: snapshot.data![0]
                                                ["crypto_name"],
                                            image: snapshot.data![0]["image"],
                                            uid: widget.uid,
                                          )),
                                );
                              },
                              child: const HeaderTextUser(
                                  "هل ترغب بمشاركة الارباح من هذه التوصية",
                                  17,
                                  Color(0xff17255A)),
                            ))
                      ]))),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _simplePopup(String uid, String name, double width, double height) =>
      PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                HeaderTextUser(
                  "نقاط دخول",
                  16,
                  Colors.white,
                ),
                Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const HeaderTextUser(
                  "نقطة خروج",
                  16,
                  Colors.white,
                ),
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const HeaderTextUser(
                  "نقاط هدف",
                  16,
                  Colors.white,
                ),
                const Icon(
                  Icons.track_changes_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
        icon: Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: const Icon(
            Icons.list,
            color: Colors.white,
          ),
        ),
        offset: const Offset(1, 1),
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD5DFE5), width: 1)),
        elevation: 20,
        color: const Color(0xff17255A),
      );
}
