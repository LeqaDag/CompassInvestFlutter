// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/ebook/all_books.dart';
import 'package:compassinvest/views/responsive/guest/recommendation/recommendation.dart';
import 'package:compassinvest/views/responsive/user/mobile/contact/contact_section.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/image_slider.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/investors_users.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../recommendation/free_recommendations.dart';
import '../shared/zoom_drawer.dart';

// ignore: must_be_immutable
class GuestDashBoard extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const GuestDashBoard({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  _GuestDashBoardState createState() => _GuestDashBoardState();
}

class _GuestDashBoardState extends State<GuestDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ZoomDrawer(
        style: DrawerStyle.Style1,
        menuScreen: MenuScreen(
          about_us: widget.about_us,
          soon: widget.soon,
          privacy: widget.privacy,
          instgram_link: widget.instgram_link,
          facebook_link: widget.facebook_link,
          website_link: widget.website_link,
        ),
        mainScreen: MainScreen(
          about_us: widget.about_us,
          soon: widget.soon,
          privacy: widget.privacy,
          instgram_link: widget.instgram_link,
          facebook_link: widget.facebook_link,
          website_link: widget.website_link,
        ),
        borderRadius: 40.0,
        showShadow: true,
        angle: -15.0,
        backgroundColor: const Color(0xffd5dfe5),
        slideWidth: MediaQuery.of(context).size.width * .65,
        openCurve: Curves.easeIn,
        closeCurve: Curves.easeInOut,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const MainScreen({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: secondColor,
          extendBodyBehindAppBar: true,
          appBar: DashboardAppBar(context, width),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                left: width * 0.04,
                right: width * 0.04,
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                children: [
                  Container(
                    height: height * 0.01,
                  ),
                  const HeaderTextUser("نشاطات كومباس انفست", 18, whiteColor),
                  Container(
                    height: height * 0.01,
                  ),
                  Container(
                      decoration: const BoxDecoration(), height: height * 0.01),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: ImageSlider(),
                  ),
                  Container(
                    height: height * 0.03,
                  ),
                  //  TradingVideo(),
                  const HeaderTextUser("توصيات مجانية", 18, whiteColor),
                  Container(
                    height: height * 0.01,
                  ),
                  FreeRecommendations(),
                  Container(
                    height: height * 0.02,
                  ),

                  Bounceable(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GuestRecommendation(
                                    about_us: widget.about_us,
                                    soon: widget.soon,
                                    privacy: widget.privacy,
                                    instgram_link: widget.instgram_link,
                                    facebook_link: widget.facebook_link,
                                    website_link: widget.website_link,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeaderTextUser("انضم الآن لتوصيات متقدمة في الربح", 17,
                            Color(0xff57a773)),
                        Icon(
                          Icons.keyboard_arrow_left,
                          color: whiteColor,
                          size: 25,
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: height * 0.03,
                  ),

                  const HeaderTextUser("جرب الكتيب الآن", 18, whiteColor),
                  Container(
                    height: height * 0.01,
                  ),
                  AllEbooksPage(
                    about_us: widget.about_us,
                    soon: widget.soon,
                    privacy: widget.privacy,
                    instgram_link: widget.instgram_link,
                    facebook_link: widget.facebook_link,
                    website_link: widget.website_link,
                    userId: 0,
                    fname: "",
                    lname: "",
                    image: "",
                    phone: 0,
                    email: "",
                  ),

                  Container(
                    height: height * 0.03,
                  ),
                  const HeaderTextUser("مستثمري كومباس انفست", 18, whiteColor),
                  Container(
                    height: height * 0.01,
                  ),
                  const InvestorsPage(),
                  Container(
                    height: height * 0.05,
                  ),
                  ContactSectionMobile(
                    instgram_link: widget.instgram_link,
                    facebook_link: widget.facebook_link,
                    website_link: widget.website_link,
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
