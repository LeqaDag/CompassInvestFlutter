// ignore_for_file: import_of_legacy_library_into_null_safe, non_constant_identifier_names, unnecessary_null_comparison

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/api/backend_api.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSectionMobile extends StatelessWidget {
  const ContactSectionMobile(
      {Key? key,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link})
      : super(key: key);
  final String instgram_link;
  final String facebook_link;
  final String website_link;

  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: kDefaultPadding * 1.5),
          const SectionTitle(
            title: " تواصل معنا ",
            subTitle: "لا تتردد بالتواصل معنا!",
            color: Color(0xFF07E24A),
          ),
          ContactBox(
            instgram_link: instgram_link,
            website_link: website_link,
            facebook_link: facebook_link,
          )
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox(
      {Key? key,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link})
      : super(key: key);

  final String instgram_link;
  final String facebook_link;
  final String website_link;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 410),
        margin: const EdgeInsets.only(top: kDefaultPadding * 2),
        padding: const EdgeInsets.all(kDefaultPadding * 2.6),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                instgram_link != null
                    ? SocalCardMobile(
                        color: const Color(0xFFD9FFFC),
                        iconSrc: "assets/images/website.png",
                        name: 'موقعنا',
                        press: () async {
                          var url = website_link;
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              universalLinksOnly: true,
                            );
                          }
                        },
                      )
                    : Container(),
                website_link != null
                    ? SocalCardMobile(
                        color: const Color(0xFFE8F0F9),
                        iconSrc: "assets/images/insta.png",
                        name: 'الانستغرام',
                        press: () async {
                          var url = instgram_link;
                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              universalLinksOnly: true,
                            );
                          }
                        },
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: kDefaultPadding * 2),
            const ContactForm(),
          ],
        ));
  }
}

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late TextEditingController emailController = TextEditingController();
    late TextEditingController nameController = TextEditingController();
    late TextEditingController messageController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                nameController.text = value;
              },
              validator: (input) {
                if (input!.isEmpty) {
                  return "الرجاء ادخال اسمك ";
                } else if (input.isEmpty) {
                  return '';
                }
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "الاسم",
                hintText: "ادخل اسمك ",
              ),
            ),
          ),
          SizedBox(
            width: 470,
            child: TextFormField(
              onChanged: (value) {
                emailController.text = value;
              },
              validator: (input) {
                if (input!.isEmpty) {
                  return "الرجاء ادخال البريد الالكتروني ";
                } else if (!input.contains('@')) {
                  return 'الرجاء ادخال بريد الكتروني صحيح!';
                } else if (input.isEmpty) {
                  return '';
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "البريد الالكتروني",
                hintText: "ادخل البريد الالكتروني",
              ),
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              onChanged: (value) {
                messageController.text = value;
              },
              validator: (input) {
                if (input!.isEmpty) {
                  return "الرجاء ادخال رسالتك ";
                } else if (input.isEmpty) {
                  return '';
                }
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "رسالتك",
                hintText: "ادخل رسالتك",
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "ارسل!",
                press: () {
                  addContact(context, nameController, emailController,
                      messageController, _formKey);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addContact(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController messageController,
      var _formKey) async {
    if (_formKey.currentState!.validate()) {
      var data = {
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text,
        'archive': 0,
      };

      BackendOperations().postData(data, contactUs);

      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: "شكرا لتواصلك معنا",
          desc: "تم ارسال رسالتك سيتم التواصل معك باقرب وقت",
          btnOkText: "حسنا",
          btnOkOnPress: () {
            nameController.clear();
            emailController.clear();
            messageController.clear();
          }).show();

      nameController.clear();
      emailController.clear();
      messageController.clear();
    }
  }
}
