// ignore_for_file: sized_box_for_whitespace, equal_keys_in_map
import 'dart:convert';

import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/pages/auth/login.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';

import 'non_active_users.dart';

// ignore: use_key_in_widget_constructors
class SignUpPage extends StatefulWidget {
  static String id = "SignUpScreen";
  const SignUpPage({Key? key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  final _formKey = GlobalKey<FormState>();
  late String error;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();

  FocusNode textFocusNodeEmail = FocusNode();
  // ignore: unused_field
  final bool _isEditingEmail = false;

  FocusNode textFocusNodePassword = FocusNode();
  String email = "";
  String password = "";
  String fname = "";
  String lname = "";
  String phone = "";
  bool isloading = false;
  late String type = '';

  @override
  void dispose() {
    isloading = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        focusNode: textFocusNodeEmail,
                        textInputAction: TextInputAction.next,
                        autofocus: false,
                        onChanged: (value) {
                          email = value.toString().trim();
                        },
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.0, left: 10.0),
                          hintText: "البريد الالكتروني",
                          hintStyle: TextStyle(
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
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: fnameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال الاسم الأول  ';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          fname = value;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.0, left: 10.0),
                          hintText: "الاسم الأول",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: lnameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال الاسم الثاني  ';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          lname = value;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.0, left: 10.0),
                          hintText: "الاسم الثاني",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField(
                        onChanged: (val) {
                          setState(() => type = val.toString());

                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        items: <String>['ذكر', 'أنثى']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                value,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Color(0xffAC8446),
                                    fontFamily: 'Amiri',
                                    fontSize: 18.0),
                              ),
                            ),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                              //Change color to Color(0xff73a16a)
                            ),
                            contentPadding: EdgeInsets.only(
                                right: width * 0.05, left: width * 0.05),
                            labelText: "الجنس",
                            labelStyle: const TextStyle(
                              fontFamily: 'Amiri',
                              fontSize: 18.0,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء ادخال رقم الجوال  ';
                          } else if (value.length < 10) {
                            return 'الرجاء ادخال رقم جوال صحيح';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          phone = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.0, left: 10.0),
                          hintText: "رقم الجوال",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: width * 0.09, left: width * 0.09),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(right: 10.0, left: 10.0),
                          hintText: "كلمة المرور",
                          hintStyle: TextStyle(
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
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
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
                        const HeaderTextUser(
                            "حساب جديد", 22, Color(0xffBB8218)),
                        Container(
                          height: height * 0.07,
                          child: ElevatedButton(
                              onPressed: () {
                                _signUpWithEmailAndPassword(
                                    emailController.text,
                                    passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffBB8218),
                                  textStyle: const TextStyle(
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

                    SizedBox(
                      height: height * 0.05,
                    ), // flat button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "هل تمتلك حساب بالفعل؟",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "تسجيل دخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: height * 0.14,
                    ),
                  ],
                ),
              )),
        ));
  }

  Future<void> _signUpWithEmailAndPassword(
      String email, String password) async {
    if (_formKey.currentState!.validate()) {
      var data = {
        'fname': fnameController.text,
        'lname': lnameController.text,
        'phone': int.parse(phoneController.text),
        'email': email,
        'password': password,
        'image':
            "https://www.shareicon.net/data/2016/05/24/770107_man_512x512.png",
        'active': false,
        'type': false,
        'gender': type
      };

      // ignore: unused_local_variable
      var res = await Network().postData(data, 'user/register');
      var body = json.decode(res.body);

      if (body['success'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => NonActiveUserHomePage(
                    fname: fnameController.text,
                    lname: lnameController.text,
                  )),
        );
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
