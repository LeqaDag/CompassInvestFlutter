// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, must_be_immutable, non_constant_identifier_names

import 'package:compassinvest/models/recommendation.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/user/mobile/recommendations/recommendation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FreeRecommendations extends StatefulWidget {
  FreeRecommendations({
    Key? key,
  }) : super(key: key);

  @override
  _FreeRecommendationsState createState() => _FreeRecommendationsState();
}

class _FreeRecommendationsState extends State<FreeRecommendations> {
  late TextEditingController intialdateval;
  late TextEditingController textControllerCode;

  @override
  Widget build(BuildContext context) {
    Recommendation recommendationData = Recommendation();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var screenSize = MediaQuery.of(context).size;
    late int recomId = 0;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder<List>(
            future: recommendationData.getAllFreeRecommendations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const PageScrollPhysics(),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Bounceable(
                                  onTap: () {
                                    recomId = snapshot.data![index]["id"];

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RecommendationDetails(
                                                recommendation_id: recomId,
                                                uid: 0,
                                              )),
                                    );
                                  },
                                  child: RecommindationContent(
                                    snapshot.data![index]["id"],
                                    snapshot.data![index]["crypto_name"],
                                    snapshot.data![index]["image"],
                                    snapshot.data![index]["type"],
                                    snapshot.data![index]["exit_point"]
                                        .toDouble(),
                                    width,
                                    height,
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text("لا يوجد توصيات حاليا"),
                );
              }
            }));
  }
}

Widget RecommindationContent(int uid, String name, String image, int type,
    double exit_point, double width, double height) {
  String image_type = "";
  if (type == 1) {
    image_type = "assets/images/long.png";
  } else {
    image_type = "assets/images/short.png";
  }

  return Container(
      height: height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor)),
      margin: EdgeInsets.only(
          left: width * 0.02, right: width * 0.02, bottom: width * 0.03),
      padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              image.toString().contains(".svg")
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.network(
                        image,
                        height: 40.0,
                        width: 40.0,
                      ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
              Container(
                width: width * 0.02,
              ),
              Text(
                name.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image_type,
              height: 50.0,
              width: 50.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                exit_point.toString(),
                style: const TextStyle(fontSize: 15, color: Color(0xffD90000)),
              ),
            ],
          ),
        ],
      ));
}
