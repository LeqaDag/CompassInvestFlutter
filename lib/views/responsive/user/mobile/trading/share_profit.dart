// ignore_for_file: avoid_print, deprecated_member_use, import_of_legacy_library_into_null_safe, prefer_if_null_operators, non_constant_identifier_names
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/api/backend_api.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class ShareTradingProfit extends StatefulWidget {
  int trading_id;
  int uid;
  ShareTradingProfit({
    Key? key,
    required this.trading_id,
    required this.uid,
  }) : super(key: key);

  @override
  _ShareTradingProfitState createState() => _ShareTradingProfitState();
}

class _ShareTradingProfitState extends State<ShareTradingProfit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController profitController = TextEditingController();
  late TextEditingController profitPercController = TextEditingController();

  List coins_data = [];

  late int coinId = 1;

  Future<String> coins() async {
    var res = await http.get(Uri.parse(allCryptoCurrencies),
        headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      coins_data = resBody;
    });

    return "Sucess";
  }

  String? imagUrl = "";
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      // ignore: unnecessary_null_comparison
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    coins();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0.0,
            title: const Text("شاركنا الارباح"),
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
                        child: HeaderTextUser(
                            "يمكنك رفع صورة", 16, Colors.black38)),
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
                      margin: EdgeInsets.fromLTRB(width * 0.15, width * 0.03,
                          width * 0.15, width * 0.08),
                      child: DropdownButtonFormField(
                        onChanged: (newVal) {
                          setState(() {
                            coinId = newVal as int;
                            print(coinId);
                          });
                        },
                        value: coinId,
                        items: coins_data.map((item) {
                          return DropdownMenuItem(
                              child: Row(
                                children: [
                                  // item['logo_url'].toString().contains(".svg")
                                  //     ? ClipRRect(
                                  //         borderRadius:
                                  //             BorderRadius.circular(8.0),
                                  //         child: SvgPicture.network(
                                  //           item['logo_url'].toString(),
                                  //           height: 20.0,
                                  //           width: 20.0,
                                  //         ))
                                  //     : ClipRRect(
                                  //         borderRadius:
                                  //             BorderRadius.circular(8.0),
                                  //         child: Image.network(
                                  //           item['logo_url'].toString(),
                                  //           height: 20.0,
                                  //           width: 20.0,
                                  //         ),
                                  //       ),
                                  Text(
                                    item['symbol']
                                        .toString()
                                        .toUpperCase(), //Names that the api dropdown contains
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              value: item['id']);
                        }).toList(),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                width: 2.0,
                              ),
                              //Change color to Color(0xff73a16a)
                            ),
                            contentPadding: EdgeInsets.only(
                                right: width * 0.05, left: width * 0.05),
                            labelText: "اسم العملة",
                            labelStyle: const TextStyle(
                              fontFamily: 'Amiri',
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(width * 0.15, width * 0.03,
                          width * 0.15, width * 0.08),
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
                      margin: EdgeInsets.fromLTRB(width * 0.15, width * 0.02,
                          width * 0.15, width * 0.1),
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
                              primary: const Color(0xff189767),
                              textStyle:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: () {
                            AwesomeDialog(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
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
                          child:
                              const HeaderTextUser("اضافة", 23, Colors.white),
                        ))
                  ])),
        ));
  }

  Future<void> addProfit(BuildContext context) async {
    if (profitPercController.text == "") profitPercController.text = "0";
    if (profitController.text == "") profitController.text = "0";
    String addimageUrl = shareProfitByUserId +
        widget.uid.toString() +
        "/" +
        widget.trading_id.toString();

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
      'currency_id': coinId
    };

    var res = await Network().postData(
        data,
        'user/trade/profit/share/' +
            widget.uid.toString() +
            "/" +
            widget.trading_id.toString());

    var body = json.decode(res.body);

    if (body['success'] == true) {}

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(true);
    });
  }
}
