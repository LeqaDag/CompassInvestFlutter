// ignore_for_file: avoid_print, deprecated_member_use, import_of_legacy_library_into_null_safe, prefer_if_null_operators, non_constant_identifier_names
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:compassinvest/models/trading_profit.dart';
import 'package:compassinvest/network_utils/api.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditTradingProfit extends StatefulWidget {
  int id;
  EditTradingProfit({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _EditTradingProfitState createState() => _EditTradingProfitState();
}

class _EditTradingProfitState extends State<EditTradingProfit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController profitController = TextEditingController(text: "");
  late TextEditingController profitPercController =
      TextEditingController(text: "");
  String percentage = "";
  String profit = "";
  @override
  void initState() {
    percentage = "";
    profit = "";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    profitController.dispose();
    profitPercController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    TradingProfit profits = TradingProfit();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0.0,
              title: const Text("تعديل الارباح"),
              centerTitle: true,
            ),
            body: FutureBuilder<List>(
                future: profits.getProfitById(widget.id),
                builder: (context, snapshot) {
             

                  if (snapshot.hasData) {
                    profitController.text =
                        snapshot.data![0]['profit'].toString();

                    profitPercController.text =
                        snapshot.data![0]['profit_percentage'].toString();
                    return Form(
                        key: _formKey,
                        child: ListView(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(width * 0.15,
                                    width * 0.15, width * 0.15, width * 0.08),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  initialValue: profitPercController.text,
                                  onChanged: (val) {
                                    setState(() {
                                      percentage = val;
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'الرجاء ادخال نسبة الارباح  ';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text('%')),
                                    labelText: 'نسبة الارباح',
                                    labelStyle: const TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(right: width * 0.05),
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
                                margin: EdgeInsets.fromLTRB(width * 0.15,
                                    width * 0.02, width * 0.15, width * 0.1),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  initialValue: profitController.text,
                                  onChanged: (val) {
                                    setState(() {
                                      profit = val;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text('\$')),
                                    labelText: ' الأرباح بالدولار',
                                    labelStyle: const TextStyle(
                                      fontFamily: 'Amiri',
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(right: width * 0.05),
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
                                        primary: mainColor,
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      AwesomeDialog(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          context: context,
                                          dialogType: DialogType.WARNING,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: "تأكيد",
                                          btnOkColor: const Color(0xFF189767),
                                          btnOkText: "نعم، أعي ذلك وموافق",
                                          desc:
                                              "هل قمت بتعديل الأرباح؟ يرجى ادخال الأرقام كما هي لضمان وصولك معنا للـ 10k ",
                                          btnOkOnPress: () {
                                            updateProfit(
                                                context, profit, percentage);
                                          }).show();
                                    },
                                    child: const HeaderTextUser(
                                        "تعديل", 23, Colors.white),
                                  ))
                            ]));
                  } else {
                    return Container();
                  }
                })));
  }

  Future<void> updateProfit(
      BuildContext context, String profit, String percentage) async {
    if (percentage == "") percentage = profitPercController.text;
    if (profit == "") profit = profitController.text;

   
    var data = {
      'profit_percentage': double.parse(percentage),
      'profit': double.parse(profit),
    };

    var res = await Network().updatetData(
        data, 'user/trade/profit/share/update/' + widget.id.toString());

    var body = json.decode(res.body);

    if (body['success'] == true) {}

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(true);
    });
  }
}
