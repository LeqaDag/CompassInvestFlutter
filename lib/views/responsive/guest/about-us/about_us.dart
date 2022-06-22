// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/guest/recommendation/recommendation.dart';
import 'package:compassinvest/views/responsive/user/mobile/contact/contact_section.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/image_slider.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/investors_users.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/photo_album.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../recommendation/free_recommendations.dart';
import '../shared/zoom_drawer.dart';

List<String> imgArray = [];

// ignore: must_be_immutable
class GuestAboutUs extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const GuestAboutUs({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  _GuestAboutUsState createState() => _GuestAboutUsState();
}

class _GuestAboutUsState extends State<GuestAboutUs> {
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
        // backgroundColor: secondColor,
        extendBodyBehindAppBar: true,
        appBar: DashboardAppBar(context, width),
        body: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/invest4.PNG"),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: <Widget>[
                          SafeArea(
                            bottom: false,
                            right: false,
                            left: false,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, left: 42, right: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: const [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, top: 42.0),
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Column(children: [
                      widget.about_us != null
                          ? Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text("من نحن",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19.0)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      right: 24,
                                      top: 30,
                                      bottom: 24),
                                  child: Text(widget.about_us,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ),
                              ],
                            )
                          : Container(),
                      widget.soon != null
                          ? Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text("قريبا",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19.0)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      right: 24,
                                      top: 30,
                                      bottom: 24),
                                  child: Text(widget.soon,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ),
                              ],
                            )
                          : Container(),
                      widget.privacy != null
                          ? Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Text("اتفاقية الاستخدام",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19.0)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      right: 24,
                                      top: 30,
                                      bottom: 24),
                                  child: Text(widget.privacy.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ),
                              ],
                            )
                          : Container(),
                      PhotoAlbum(
                        imgArray: imgArray,
                      )
                    ]),
                  )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    widget.instgram_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = widget.instgram_link;
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  universalLinksOnly: true,
                                );
                              }
                            },
                            elevation: 4.0,
                            fillColor: const Color(0xff17255A),
                            child: const Icon(FontAwesomeIcons.instagram,
                                size: 14.0, color: Colors.white),
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            shape: const CircleBorder(),
                          )
                        : Container(),
                    widget.website_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = widget.website_link;
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  universalLinksOnly: true,
                                );
                              }
                            },
                            elevation: 4.0,
                            fillColor: const Color(0xff17255A),
                            child: const Icon(FontAwesomeIcons.google,
                                size: 14.0, color: Colors.white),
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            shape: const CircleBorder(),
                          )
                        : Container(),
                    widget.facebook_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = widget.facebook_link;
                              if (await canLaunch(url)) {
                                await launch(
                                  url,
                                  universalLinksOnly: true,
                                );
                              }
                            },
                            elevation: 4.0,
                            fillColor: const Color(0xff17255A),
                            child: const Icon(FontAwesomeIcons.facebook,
                                size: 14.0, color: Colors.white),
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            shape: const CircleBorder(),
                          )
                        : Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
