//ignore_for_file: file_names, non_constant_identifier_names, prefer_is_empty
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/models/trade.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

class LastTradeProfitMobile extends StatefulWidget {
  final int uid;
  final int trade_id;
  const LastTradeProfitMobile(
      {Key? key, required this.uid, required this.trade_id})
      : super(key: key);

  @override
  State<LastTradeProfitMobile> createState() => _LastTradeProfitMobileState();
}

class _LastTradeProfitMobileState extends State<LastTradeProfitMobile> {
  @override
  Widget build(BuildContext context) {
    Trading tradeData = Trading();

    return Column(
      children: [
        FutureBuilder<List>(
            future: tradeData.getLastTradingUser(widget.uid, widget.trade_id),
            builder: (context, snapshot) {
              if (snapshot.data?.length == 0) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: const Color(0xFFFF312E)),
                    onPressed: () {
                      showAlertDialog(context, widget.uid, widget.trade_id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.warning),
                        const Text('لم تقم بادخال ارباح آخر صفقة'),
                      ],
                    ));
              }

              return Container();
            }),
      ],
    );
  }
}

showAlertDialog(BuildContext context, int uid, int tradeId) {
  late TextEditingController profitController = TextEditingController();
  late TextEditingController profitPercController = TextEditingController();

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "شاركنا الارباح",
      textAlign: TextAlign.center,
    ),
    content: Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        child: Wrap(
          spacing: kDefaultPadding * 2.5,
          runSpacing: kDefaultPadding * 1.5,
          children: [
            SizedBox(
              width: 270,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: profitPercController,
                decoration: const InputDecoration(
                  labelText: "نسبة الأرباح",
                  hintText: "ادخل نسبة الأرباح ",
                ),
              ),
            ),
            SizedBox(
              width: 270,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: profitController,
                decoration: const InputDecoration(
                  labelText: "الأرباح بالدولار",
                  hintText: "ادخل الأرباح بالدولار",
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
                    AwesomeDialog(
                        width: 400,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.BOTTOMSLIDE,
                        title: "تأكيد",
                        btnOkColor: const Color(0xFF189767),
                        btnOkText: "نعم، أعي ذلك وموافق",
                        desc:
                            "هل أدخلت الأرباح كما هي؟ يجب الالتزام بالقواعد جميعها لضمان الوصول للقمة  ",
                        btnOkOnPress: () {
                          addProfit(context, profitController,
                              profitPercController, uid, tradeId);
                        }).show();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ),
    actions: const [],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> addProfit(
    BuildContext context,
    TextEditingController profitController,
    TextEditingController profitPercController,
    int uid,
    int trade_id) async {

  var data = {
    'profit_percentage': double.parse(profitPercController.text),
    'profit': double.parse(profitController.text),
  };

  var res = await Network().postData(data,
      'user/trade/profit/last/' + uid.toString() + "/" + trade_id.toString());

  var body = json.decode(res.body);

  if (body['success'] == true) {

  }

  Future.delayed(const Duration(seconds: 1), () {
    Navigator.of(context).pop(true);
  });
}
