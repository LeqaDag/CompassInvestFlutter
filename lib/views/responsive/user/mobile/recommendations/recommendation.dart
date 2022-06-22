// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'newest_recommendations.dart';
import 'oldest_recommendations.dart';


class RecommendationsUsers extends StatefulWidget {
  int? notification;
  int uid;
  RecommendationsUsers({Key? key, this.notification, required this.uid})
      : super(key: key);

  @override
  _RecommendationsUsersState createState() => _RecommendationsUsersState();
}

class _RecommendationsUsersState extends State<RecommendationsUsers> {
  late TextEditingController intialdateval;
  late TextEditingController textControllerCode;

  @override
  void setState(VoidCallback fn) {
    widget.notification = 0;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: const Color(0xffF8F8F8),
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                bottom: const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Color(0xffD5DFE5),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Color(0xffF8F8F8)),
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "التوصيات الجديدة",
                            style:
                                TextStyle(fontSize: 18.0, fontFamily: 'Amiri'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "التوصيات القديمة",
                            style:
                                TextStyle(fontSize: 18.0, fontFamily: 'Amiri'),
                          ),
                        ),
                      ),
                    ]),
                title: const Text("التوصيات"),
                backgroundColor: const Color(0xff17255A),
                elevation: 0.0,
                centerTitle: true,
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: double.infinity,
                        height: height * 2,
                        margin: EdgeInsets.all(width * 0.04),
                        decoration: const BoxDecoration(
                            //color: Colors.white,
                            ),
                        child: RecommendationTabBarContent(widget.uid)),
                  ],
                ),
              )),
            )));
  }
}

class RecommendationTabBarContent extends StatelessWidget {
  int uid;
  RecommendationTabBarContent(this.uid);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        NewestRecommendationsUsers(
          uid: uid,
        ),
        OldestRecommendationsUsers(
          uid: uid,
        ),
      ],
    );
  }
}
