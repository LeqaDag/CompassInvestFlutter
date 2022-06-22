// ignore_for_file: non_constant_identifier_names

import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/pages/signin_options.dart';
import 'package:compassinvest/views/responsive/guest/about-us/about_us.dart';
import 'package:compassinvest/views/responsive/guest/recommendation/recommendation.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/about-us.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';
import '../trading/trading.dart';

class AppDrawer extends StatelessWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const AppDrawer({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: secondColor,
        child: ListView(
          children: [
            _createHeader(width),
            _createDrawerItem(width,
                text: "   الصفحة الرئيسية", icon: Icons.home_sharp, onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GuestDashBoard(
                            about_us: about_us,
                            soon: soon,
                            privacy: privacy,
                            instgram_link: instgram_link,
                            facebook_link: facebook_link,
                            website_link: website_link,
                          )));
            }),
            _createDrawerItem(width,
                text: "   التداول", icon: Icons.monetization_on, onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GuestTrading(
                            about_us: about_us,
                            soon: soon,
                            privacy: privacy,
                            instgram_link: instgram_link,
                            facebook_link: facebook_link,
                            website_link: website_link,
                          )));
            }),
            _createDrawerItem(width, text: "   التوصيات", icon: Icons.recommend,
                onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GuestRecommendation(
                            about_us: about_us,
                            soon: soon,
                            privacy: privacy,
                            instgram_link: instgram_link,
                            facebook_link: facebook_link,
                            website_link: website_link,
                          )));
            }),
            _createDrawerItem(width,
                text: "   تسجيل حساب", icon: Icons.approval, onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInOptionsScreen(
                            about_us: about_us,
                            soon: soon,
                            instgram_link: instgram_link,
                            facebook_link: facebook_link,
                            website_link: website_link,
                            privacy: privacy,
                          )));
            }),
            _createDrawerItem(width,
                text: "    حول التطبيق", icon: Icons.app_blocking, onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GuestAboutUs(
                            about_us: about_us,
                            soon: soon,
                            instgram_link: instgram_link,
                            facebook_link: facebook_link,
                            website_link: website_link,
                            privacy: privacy,
                          )));
            }),
          ],
        ),
      ),
    );
  }
}

Widget _createHeader(double width) {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors
        color: secondColor,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width * 0.23,
              height: width * 0.23,
              margin: EdgeInsets.only(right: width * 0.04, top: width * 0.04),
              child: const CircleAvatar(
                backgroundColor: whiteColor,
                radius: 50,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
            ),
            // ignore: prefer_const_constructors
          ]));
}

Widget _createDrawerItem(double width,
    {IconData? icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: whiteColor,
          size: width * 0.07,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.07),
          child: Text(
            text,
            style: TextStyle(
              color: whiteColor,
              fontSize: width * 0.04,
            ),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
