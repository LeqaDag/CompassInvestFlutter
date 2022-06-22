// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, must_be_immutable

import 'package:compassinvest/models/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import 'recommendation_details.dart';
import 'shared.dart';

class OldestRecommendationsUsers extends StatefulWidget {
  int uid;
   OldestRecommendationsUsers({
    Key? key,
    required this.uid
  }) : super(key: key);

  @override
  _OldestRecommendationsUsersState createState() =>
      _OldestRecommendationsUsersState();
}

class _OldestRecommendationsUsersState
    extends State<OldestRecommendationsUsers> {
  late TextEditingController intialdateval;
  late TextEditingController textControllerCode;

  @override
  Widget build(BuildContext context) {
    Recommendation recommendationData = Recommendation();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late int recomId = 0;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: FutureBuilder<List>(
            future: recommendationData.getAllOldRecommendations(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          physics: const PageScrollPhysics(),
                          children: [
                            GridView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
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
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 4.82,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 5),
                            )
                          ],
                        ),
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
