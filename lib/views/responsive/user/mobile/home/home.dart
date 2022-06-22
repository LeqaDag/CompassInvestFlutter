// ignore_for_file: unused_element, unused_local_variable, non_constant_identifier_names, import_of_legacy_library_into_null_safe, avoid_print
import 'package:compassinvest/models/trade.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/ebook/all_books.dart';
import 'package:compassinvest/views/responsive/user/mobile/contact/contact_section.dart';
import 'package:compassinvest/views/responsive/user/mobile/recommendations/newest_recommendations.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'image_slider.dart';
import 'investors_users.dart';
import 'lastTradeProfit.dart';
import 'profits_user.dart';
import 'recommendation_profits.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key,
      required this.about_us,
      required this.soon,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link,
      required this.privacy,
      required this.fname,
      required this.lname,
      required this.image,
      required this.uid,
      required this.email,
      required this.phone})
      : super(key: key);

  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  final String fname;
  final String lname;
  final String image;
  final int uid;
  final String email;
  final int phone;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late int number = 0;
  late String lastTradeId = "";
  late String userId = "";
  late String tradingIdUser = "";
  late FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  _registerOnFirebase() {
    firebaseMessaging.subscribeToTopic('all');
    firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    // _registerOnFirebase();
    // getMessage();
    super.initState();
    _registerOnFirebase();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Trading tradeData = Trading();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              const Text(
                "أهلا ",
                style: TextStyle(
                    color: Color(0xff17255A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              Text(
                widget.fname,
                style: const TextStyle(
                    color: Color(0xff17255A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(
              left: width * 0.06,
              right: width * 0.06,
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              children: [
                Container(
                    decoration: const BoxDecoration(), height: height * 0.01),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: ImageSlider(),
                ),
                Container(
                  height: height * 0.05,
                ),
                FutureBuilder<List>(
                    future: tradeData.getAllTrading(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return LastTradeProfitMobile(
                            uid: widget.uid, trade_id: snapshot.data![0]["id"]);
                      }
                      return const GFLoader(type: GFLoaderType.ios);
                    }),
                const HeaderTextUser(
                    "الارباح من الصفقات", 18, Color(0xff17255A)),
                ProfitForUserSectionMobile(uid: widget.uid),
                const HeaderTextUser(
                    "الارباح من التوصيات", 18, Color(0xff17255A)),
                RecommendationProfitForUserSectionMobile(uid: widget.uid),
                GestureDetector(
                  onTap: () {},
                  child: const HeaderTextUser(
                      "آخر التوصيات", 18, Color(0xff17255A)),
                ),
                NewestRecommendationsUsers(uid: widget.uid),
                Container(
                  height: height * 0.03,
                ),
                const HeaderTextUser("جرب الكتيب مجانا", 18, Color(0xff17255A)),
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
                  userId: widget.uid,
                  fname: widget.fname,
                  lname: widget.lname,
                  image: widget.image,
                  email: widget.email,
                  phone: widget.phone,
                ),
                Container(
                  height: height * 0.01,
                ),
                const HeaderTextUser(
                    "مستثمري كومباس انفست", 18, Color(0xff17255A)),
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
        ),
      ),
    );
  }
}
