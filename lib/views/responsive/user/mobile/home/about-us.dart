// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'photo_album.dart';
//widgets

List<String> imgArray = [];

class AboutUsPage extends StatelessWidget {
  const AboutUsPage(
      {Key? key,
      required this.about_us,
      required this.soon,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link,
      required this.privacy})
      : super(key: key);

  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: <Widget>[
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
                      about_us != null
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
                                  child: Text(about_us,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ),
                              ],
                            )
                          : Container(),
                      soon != null
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
                                  child: Text(soon,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black38)),
                                ),
                              ],
                            )
                          : Container(),
                      privacy != null
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
                                  child: Text(privacy.toString(),
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
                    instgram_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = instgram_link;
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
                    website_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = website_link;
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
                    facebook_link != null
                        ? RawMaterialButton(
                            constraints:
                                BoxConstraints.tight(const Size(38, 38)),
                            onPressed: () async {
                              var url = facebook_link;
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
        ));
  }
}
