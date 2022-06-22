// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields, unused_field, avoid_print, non_constant_identifier_names

import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/pages/auth/login.dart';
import 'package:compassinvest/views/responsive/guest/home/home.dart';
import 'package:compassinvest/views/responsive/guest/trading/size_config.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PaidEbookDetailsPage extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const PaidEbookDetailsPage({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  State<PaidEbookDetailsPage> createState() => _PaidEbookDetailsPageState();
}

class _PaidEbookDetailsPageState extends State<PaidEbookDetailsPage> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double blockH = SizeConfig.blockH!;
    double blockV = SizeConfig.blockV!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black45,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Image(
          image: AssetImage("assets/images/logo.png"),
          width: 150,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GuestDashBoard(
                          about_us: widget.about_us,
                          soon: widget.soon,
                          privacy: widget.privacy,
                          instgram_link: widget.instgram_link,
                          facebook_link: widget.facebook_link,
                          website_link: widget.website_link,
                        )));
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: HeaderTextUser("!لتصفح المزيد من بنك المعلومات سجل حساب الآن",
                  17, const Color(0xff17255A)),
            ),
            Image.asset(
              "assets/gif/invest.gif",
              height: 250,
            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: SizedBox(
                width: width * 0.8,
                height: height * 0.06,
                child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoggedIn = true;
                      });

                      await _googleSignIn.signIn().then((result) {
                        print(result);
                        // var fullName = result!.displayName.toString();
                        var fullName = "Leqa Daghameen";
                        print(fullName.split(' '));
                        var fname = fullName.split(' ')[0];
                        var lname = fullName.split(' ')[1];

                        print(fname);
                        print(lname);

                        // if (result != null) {
                        //   Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //       fullscreenDialog: true,
                        //       builder: (context) => UserHome(
                        //           about_us: widget.about_us,
                        //           soon: widget.soon,
                        //           instgram_link: widget.instgram_link,
                        //           facebook_link: widget.facebook_link,
                        //           website_link: widget.website_link,
                        //           privacy: widget.privacy,
                        //           fname: fname,
                        //           lname: lname,
                        //           image: result.photoUrl.toString(),
                        //           email: result.email.toString(),
                        //           uid: 0,
                        //           phone: 0),
                        //     ),
                        //   );
                        // }
                      }).catchError((error) {
                        print('Registration Error: $error');
                      });
                      setState(() {
                        _isLoggedIn = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
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
                        const HeaderTextUser(
                            " تسجيل دخول باستخدام جوجل ", 14, blackColor),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          image: AssetImage(
                            "assets/images/google.png",
                          ),
                          width: 30,
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: width * 0.8,
                height: height * 0.06,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
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
                        const HeaderTextUser(
                            " تسجيل دخول باستخدام ايميل وكلمة سر  ",
                            14,
                            blackColor),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
