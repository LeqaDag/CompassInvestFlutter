// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/pages/signin_options.dart';
import 'package:compassinvest/views/responsive/guest/trading/onboarding_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../shared/zoom_drawer.dart';
import 'size_config.dart';

// ignore: must_be_immutable
class GuestTrading extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const GuestTrading({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  _GuestTradingState createState() => _GuestTradingState();
}

class _GuestTradingState extends State<GuestTrading> {
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
  final _controller = PageController();
  int _currentPage = 0;
  List colors = [
    const Color(0xffDAD3C8),
    const Color(0xffFFE5DE),
    const Color(0xffDCF6E6)
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: goldColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double blockH = SizeConfig.blockH!;
    double blockV = SizeConfig.blockV!;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: DashboardAppBar(context, width),
          backgroundColor: secondColor,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) =>
                        setState(() => _currentPage = value),
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Image.asset(
                              contents[i].image,
                              height: SizeConfig.blockV! * 25,
                            ),
                            SizedBox(
                              height: (height >= 840) ? 60 : 30,
                            ),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w600,
                                fontSize: (width <= 550) ? 30 : 35,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              contents[i].desc,
                              style: TextStyle(
                                color: Colors.white54,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w300,
                                fontSize: (width <= 550) ? 17 : 25,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(index: index),
                        ),
                      ),
                      _currentPage + 1 == contents.length
                          ? Padding(
                              padding: const EdgeInsets.all(30),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignInOptionsScreen(
                                                about_us: widget.about_us,
                                                soon: widget.soon,
                                                instgram_link:
                                                    widget.instgram_link,
                                                facebook_link:
                                                    widget.facebook_link,
                                                website_link:
                                                    widget.website_link,
                                                privacy: widget.privacy,
                                              )));
                                },
                                child: const Text("سجل الآن"),
                                style: ElevatedButton.styleFrom(
                                  primary: whiteColor,
                                  onPrimary: secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: (width <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 20)
                                      : EdgeInsets.symmetric(
                                          horizontal: width * 0.2,
                                          vertical: 25),
                                  textStyle: TextStyle(
                                      color: goldColor,
                                      fontSize: (width <= 550) ? 13 : 17),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      _controller.jumpToPage(3);
                                    },
                                    child: const Text(
                                      "تخطي",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                    style: TextButton.styleFrom(
                                      elevation: 0,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: (width <= 550) ? 13 : 17,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    child: const Text("التالي"),
                                    style: ElevatedButton.styleFrom(
                                      primary: goldColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      elevation: 0,
                                      padding: (width <= 550)
                                          ? const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 20)
                                          : const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 25),
                                      textStyle: TextStyle(
                                          fontSize: (width <= 550) ? 13 : 17),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
