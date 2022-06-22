// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, unused_import, must_be_immutable

import 'package:compassinvest/models/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'recommendation_details.dart';
import 'shared.dart';

class NewestRecommendationsUsers extends StatefulWidget {
  int uid;
  NewestRecommendationsUsers({Key? key, required this.uid}) : super(key: key);

  @override
  _NewestRecommendationsUsersState createState() =>
      _NewestRecommendationsUsersState();
}

class _NewestRecommendationsUsersState
    extends State<NewestRecommendationsUsers> {
  late TextEditingController intialdateval;
  late TextEditingController textControllerCode;

  @override
  Widget build(BuildContext context) {
    Recommendation? recommendationData = Recommendation();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late int recomId = 0;
    var screenSize = MediaQuery.of(context).size;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder<List>(
            future: recommendationData.getAllNewRecommendations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
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
                                              uid: widget.uid,
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
                      ),
                    ],
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
