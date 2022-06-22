// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/api/backend_api.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/responsive/user/mobile/profile/profile_widget.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.image,
      required this.email,
      required this.uid,
      required this.phone})
      : super(key: key);
  final String fname;
  final String lname;
  final String image;
  final String email;
  final int uid;
  final int phone;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();

    fnameController = TextEditingController(text: widget.fname);
    lnameController = TextEditingController(text: widget.lname);
    phoneController =
        TextEditingController(text: '0' + widget.phone.toString());
  }

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    String addimageUrl = changePictureById + widget.uid.toString();
    print(fnameController.text);
    print(lnameController.text);
    print(phoneController.text);
    if (_image != null) {
      var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
      var length = await _image!.length();
      var uri = Uri.parse(addimageUrl);
      var request = http.MultipartRequest('POST', uri);
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(_image!.path));
      request.files.add(multipartFile);
      var response = await request.send();

      print(response.request);
      print(response.stream);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('uploaded');
      } else {
        print('not uploaded');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            _buildImage(),
            const SizedBox(height: 20),
            buildName(widget.fname, widget.lname, widget.email),
            const SizedBox(height: 24),

            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.15, width * 0.05, width * 0.15, width * 0.07),
              child: TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return "الرجاء ادخال الاسم الأول ";
                  } else if (input.isEmpty) {
                    return '';
                  }
                },
                style: const TextStyle(color: Colors.black),
                controller: fnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.verified_user)),
                  labelText: 'الاسم الأول',
                  labelStyle: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.only(right: width * 0.05),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.15, width * 0.01, width * 0.15, width * 0.07),
              child: TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return "الرجاء ادخال الاسم الثاني ";
                  } else if (input.isEmpty) {
                    return '';
                  }
                },
                style: const TextStyle(color: Colors.black),
                controller: lnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.verified_user)),
                  labelText: 'الاسم الثاني',
                  labelStyle: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.only(right: width * 0.05),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.15, width * 0.01, width * 0.15, width * 0.07),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال رقم الجوال  ';
                  } else if (value.length < 10) {
                    return 'الرجاء ادخال رقم جوال صحيح';
                  }
                  return null;
                },
                style: const TextStyle(color: Colors.black),
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(15), child: Icon(Icons.phone)),
                  labelText: 'رقم الجوال',
                  labelStyle: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.only(right: width * 0.05),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: height * 0.13,
              width: width * 0.02,
              margin: EdgeInsets.fromLTRB(width * 0.18, 20, width * 0.18, 20),
              child: ElevatedButton(
                  onPressed: () {
                    updateProfile(context);
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
                        Icons.edit,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      HeaderTextUser("تعديل", 16, Colors.white),
                    ],
                  )),
            ),

            const SizedBox(height: 48),
            // buildAbout(user),
          ],
        ),
      ),
    );
  }

  void updateProfile(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var data = {
        'fname': fnameController.text,
        'lname': lnameController.text,
        'phone': int.parse(phoneController.text)
      };

      var res = await Network()
          .postData(data, 'user/updateProfile/' + widget.uid.toString());
      var body = json.decode(res.body);

      if (body['success'] == true) {
        AwesomeDialog(
          padding: EdgeInsets.only(left: 20, right: 20),
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: "تحديث البيانات",
          btnOkColor: Color(0xFF189767),
          desc: "تم تحديث البيانات ",
        ).show();
      }
    }
  }

  Widget _buildImage() {
    if (_image == null) {
      return ProfileWidget(
        imagePath: widget.image,
        isEdit: true,
        onClicked: () async {
          getImage();
        },
      );
    } else {
      return Column(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Image.file(
                _image!,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
              ),
            ),
          )
        ],
      );
    }
  }

  Widget buildName(String name, String lname, String email) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$name $lname",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );
}
