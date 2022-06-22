
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';


class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(
          left: width * 0.06, right: width * 0.06, top: width * 1.1),
      child: ListView(
        shrinkWrap: true,
        children: [

          const HeaderTextUser("آخر التوصيات", 18, Color(0xff17255A)),
        //  Container(child: NewestRecommendationsUsers()),
          Container(
            height: height * 0.04,
          ),
          // HeaderTextUser(
          //     "اختر خطتك", 18, Color(0xff17255A)),
          // CoursePage(),
          Container(
            height: height * 0.04,
          ),
          const HeaderTextUser("مستثمري كومباس انفست", 18, Color(0xff17255A)),
          Container(
            height: height * 0.01,
          ),
         // InvestorsPage(),
          Container(
            height: height * 0.2,
          )
        ],
      ),
    );
  }
}