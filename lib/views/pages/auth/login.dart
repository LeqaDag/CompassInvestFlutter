// ignore_for_file: avoid_print, prefer_const_constructors, import_of_legacy_library_into_null_safe, non_constant_identifier_names
import 'dart:convert';

import 'package:compassinvest/models/setting.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/services/auth.dart';
import 'package:compassinvest/views/pages/maintenance.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:compassinvest/views/user/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forget_password.dart';
import 'non_active_users.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  static String id = "LoginScreen";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  final _formKey = GlobalKey<FormState>();
  late String error;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode textFocusNodeEmail = FocusNode();
  // ignore: unused_field
  bool _isEditingEmail = false;

  FocusNode textFocusNodePassword = FocusNode();
  bool wrongEmail = false;
  bool wrongPassword = false;

  String about_us = "";
  String privacy = "";
  String soon = "";
  String instgram_link = "";
  String facebook_link = "";
  String website_link = "";
  int close_app = 0;
  @override
  void dispose() {
    wrongEmail = false;
    wrongPassword = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Setting settingData = Setting();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          // backgroundColor: Color(0xff010E1F),
          body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff010E1F),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    height: height * 0.27,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff010E1F),
                            Color(0xffAC8446),
                          ],
                          begin: Alignment(-1.0, -1.0),
                          end: Alignment(-0.5, -0.5),
                          tileMode: TileMode.mirror),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/login.png",
                      height: height * 0.46,
                    ),
                  )
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(right: width * 0.09, left: width * 0.09),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  focusNode: textFocusNodeEmail,
                  textInputAction: TextInputAction.next,
                  autofocus: false,
                  onChanged: (value) {
                    _isEditingEmail = true;
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(right: 10.0, left: 10.0),
                    hintText: "البريد الالكتروني",
                    hintStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "الرجاء ادخال البريد الالكتروني ";
                    } else if (!input.contains('@')) {
                      return 'الرجاء ادخال بريد الكتروني صحيح!';
                    } else if (input.isEmpty) {
                      return '';
                    }
                  },
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              Container(
                margin:
                    EdgeInsets.only(right: width * 0.09, left: width * 0.09),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(right: 10.0, left: 10.0),
                    hintText: "كلمة المرور",
                    hintStyle: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "الرجاء ادخال كلمة المرور";
                    }
                    // } else if (input.length < 7) {
                    //   return 'كلمة المرور غير مطابقة';
                    // }
                    return null;
                  },
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const HeaderTextUser("تسجيل دخول", 22, Color(0xffBB8218)),
                  SizedBox(
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () {
                          _signInWithEmailAndPassword(emailController.text,
                              passwordController.text, context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffBB8218),
                            textStyle: const TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color(0xffBB8218),
                            )),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                        )),
                  ),
                ],
              ),
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
              SizedBox(
                height: height * 0.05,
              ), // flat button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    child: const Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      "تسجيل حساب",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // Image.asset(
              //   "assets/images/logo.png",
              //   height: height * 0.18,
              // ),
              // Center(child: GoogleButton()),
            ],
          ),
        ),
      )),
    );
  }

  void _signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var data = {
        'email': email,
        'password': password,
      };

      Map creds = {
        'email': email,
        'password': password,
      };

      // Provider.of<Auth>(context, listen: false).login(creds: creds);
      var res = await Network().postData(data, 'user/login');
      var body = json.decode(res.body);
      print(body);
      if (body['success'] == true) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        if (close_app == 0) {
          print(json.encode(body['user']['active']));
          // ignore: unrelated_type_equality_checks
          if (json.encode(body['user']['active']) == "1") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UserHome(
                        about_us: about_us,
                        soon: soon,
                        privacy: privacy,
                        instgram_link: instgram_link,
                        facebook_link: facebook_link,
                        website_link: website_link,
                        fname: body['user']['fname'],
                        lname: body['user']['lname'],
                        image: body['user']['photo_path'],
                        email: body['user']['email'],
                        uid: int.parse(
                          json.encode(body['user']['id']),
                        ),
                        phone: int.parse(json.encode(body['user']['phone'])),
                      )),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => NonActiveUserHomePage(
                        fname: json.encode(body['user']['fname'].toString()),
                        lname: json.encode(body['user']['lname'].toString()),
                      )),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MaintenancePage()),
          );
        }
      } else if (body['success'] == false) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Center(
                child: Text(
              '  حدث خطأ ما',
              style: TextStyle(color: Colors.red),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  body['message'],
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'موافق',
                  style: TextStyle(fontSize: 17, color: Color(0xff292765)),
                ),
              )
            ],
          ),
        );
      }
    }
  }
}
