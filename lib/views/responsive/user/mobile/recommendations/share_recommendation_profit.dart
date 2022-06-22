// ignore_for_file: non_constant_identifier_names, avoid_print, deprecated_member_use

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/api/backend_api.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class ShareRecommendationProfit extends StatefulWidget {
  int recommendation_id;
  String name;
  String image;
  int uid;

  ShareRecommendationProfit(
      {Key? key,
      required this.recommendation_id,
      required this.name,
      required this.image,
      required this.uid})
      : super(key: key);

  @override
  _ShareRecommendationProfitState createState() =>
      _ShareRecommendationProfitState();
}

class _ShareRecommendationProfitState extends State<ShareRecommendationProfit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController profitController = TextEditingController();
  late TextEditingController profitPercController = TextEditingController();
  String? imagUrl = "";
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
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff17255A),
            elevation: 0.0,
            title: Text(widget.name),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    height: width * 0.1,
                  ),
                  const Center(
                      child:
                          HeaderTextUser("يمكنك رفع صورة", 16, Colors.black)),
                  Padding(
                    padding: EdgeInsets.all(width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            getImage();
                          },
                          child: const Icon(
                            Icons.library_add,
                            color: Color(0xffD5DFE5),
                            size: 40,
                          ),
                        ),
                        if (_image != null)
                          Image.file(
                            _image!,
                            width: width * 0.45,
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        width * 0.15, width * 0.05, width * 0.15, width * 0.1),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: profitPercController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال نسبة الارباح  ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(15), child: Text('%')),
                        labelText: 'نسبة الارباح',
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
                        width * 0.15, width * 0.05, width * 0.15, width * 0.1),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: profitController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(15), child: Text('\$')),
                        labelText: ' الأرباح بالدولار',
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
                      width: width * 0.4,
                      height: height * 0.12,
                      margin: EdgeInsets.only(
                          top: width * 0.04,
                          left: width * 0.2,
                          right: width * 0.2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff17255A),
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          AwesomeDialog(
                              width: 600,
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              context: context,
                              dialogType: DialogType.WARNING,
                              animType: AnimType.BOTTOMSLIDE,
                              title: "تأكيد",
                              btnOkColor: const Color(0xFF189767),
                              btnOkText: "نعم، أعي ذلك وموافق",
                              desc:
                                  "هل أدخلت الأرباح كما هي؟ يجب الالتزام بالقواعد جميعها لضمان الوصول للقمة  ",
                              btnOkOnPress: () {
                                addProfit(context);
                              }).show();
                        },
                        child: const HeaderTextUser("اضافة", 23, Colors.white),
                      )),
                ]),
          ),
        ));
  }

  Future<void> addProfit(BuildContext context) async {
    if (profitPercController.text == "") profitPercController.text = "0";
    if (profitController.text == "") profitController.text = "0";
    String addimageUrl = shareRecommendationByUserId +
        widget.uid.toString() +
        "/" +
        widget.recommendation_id.toString();

    if (_image != null) {
      var stream = http.ByteStream(DelegatingStream.typed(_image!.openRead()));
      var length = await _image!.length();
      var uri = Uri.parse(addimageUrl);
      var request = http.MultipartRequest('POST', uri);
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(_image!.path));
      request.files.add(multipartFile);
      var response = await request.send();

      if (response.statusCode == 200) {
        print('uploaded');
      } else {
        print('not uploaded');
      }
    }

    var data = {
      'profit_percentage': double.parse(profitPercController.text),
      'profit': double.parse(profitController.text),
    };

    var res = await Network().postData(
        data,
        'user/recommendation/profit/data/' +
            widget.uid.toString() +
            "/" +
            widget.recommendation_id.toString());

    var body = json.decode(res.body);

    if (body['success'] == true) {}

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(true);
    });
  }
}
