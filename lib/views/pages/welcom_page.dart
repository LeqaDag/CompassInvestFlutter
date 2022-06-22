// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:compassinvest/models/setting.dart';
import 'package:compassinvest/views/pages/maintenance.dart';
import 'package:compassinvest/views/responsive/guest/home/home.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String about_us = "";
  String privacy = "";
  String soon = "";
  String instgram_link = "";
  String facebook_link = "";
  String website_link = "";
  int close_app = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Setting settingData = Setting();

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List>(
              future: settingData.getSettingsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  close_app = snapshot.data![0]["close_application"];
                  if (close_app == 0) {
                    about_us = snapshot.data![0]["about_us"];
                    soon = snapshot.data![0]["soon"];
                    privacy = snapshot.data![0]["privacy"];
                    instgram_link = snapshot.data![0]["instgram_link"];
                    facebook_link = snapshot.data![0]["facebook_link"];
                    website_link = snapshot.data![0]["website_link"];
                  }
                }
                return Container();
              }),
          Text(
            "أهلا بك في تطبيق كومباس انفست",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: mainFontType,
                fontWeight: FontWeight.bold,
                color: Color(0xff17255A),
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/invest.png",
            width: 150,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "بالمتابعة واستخدامك للتطبيق, انت توافق على شروط الخدمة وسياسة التطبيق",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: mainFontType, fontSize: 18),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: height * 0.07,
            width: width * 0.4,
            child: ElevatedButton(
                onPressed: () {
                  if (close_app == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuestDashBoard(
                        about_us: about_us,
                        soon: soon,
                        privacy: privacy,
                        instgram_link: instgram_link,
                        facebook_link: facebook_link,
                        website_link: website_link,
                      )),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaintenancePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff17255A),
                    textStyle: const TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xffBB8218),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    Text(
                      "تأكيد",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: mainFontType, fontSize: 18),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
