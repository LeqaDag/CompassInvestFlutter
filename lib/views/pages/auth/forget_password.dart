import 'dart:convert';

import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  static String id = "LoginScreen";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: const Color(0xff010E1F),
          body: Form(
            key: _formKey,
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
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const HeaderTextUser(
                        "تغيير كلمة المرور", 22, Color(0xffBB8218)),
                    SizedBox(
                      height: height * 0.07,
                      child: ElevatedButton(
                          onPressed: () {
                            _passwordReset(emailController.text);
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: const Text(
                        "هل قمت بتغيير كلمة المرور؟",
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
    );
  }

  Future _passwordReset(String email) async {
    if (_formKey.currentState!.validate()) {
      var data = {
        'email': email,
      };

      var res = await Network().postData(data, 'user/reset');
      var body = json.decode(res.body);

      if (body['success'] == true) {}
      // try {
      //   await _auth.sendPasswordResetEmail(email: email);
      //   showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //       title: const Text('اعادة تعيين كلمة المرور'),
      //       content: const Text('يرجى مراجعة البريد الالكتروني'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx).pop();
      //           },
      //           child: const Text('Okay'),
      //         )
      //       ],
      //     ),
      //   );
      // } on Exception catch (e) {
      //   showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //       title: const Text('يا الهي! حدث خطأ ما'),
      //       content: Text('${e}'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx).pop();
      //           },
      //           child: const Text('Okay'),
      //         )
      //       ],
      //     ),
      //   );
      // }
    }
  }
}
