// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:compass_invest/views/responsive/user/web/components/default_button.dart';
// import 'package:compass_invest/views/responsive/user/web/components/section_title.dart';
// import 'package:compass_invest/views/user/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:toast/toast.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'components/image_slider.dart';
// import 'components/profit_travel.dart';
// import 'components/socal_card.dart';


// // ignore: must_be_immutable
// class TravelSectionMobile extends StatelessWidget {
//   String uid;
//   bool isTravel;
//   TravelSectionMobile({Key? key, required this.isTravel, required this.uid})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ImageSliderMobile(),
//           Container(
//             // this height only for demo
//             // height: 500,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Color(0xFFE8F0F9),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage("assets/images/bg_img_2.png"),
//               ),
//             ),
//             child: Column(
//               children: [
//                 isTravel == true
//                     ? ProfitForUserSectionTravelMobile(uid: uid)
//                     : Container(),
//                 SizedBox(height: kDefaultPadding * 1.5),
//                 SectionTitle(
//                   title: " سافر معنا ",
//                   subTitle: " ضاعف أموالك خلال 6 أيام فقط! ",
//                   color: Color(0xFF07E24A),
//                 ),
//                 ContactBox(
//                   isTravel: isTravel,
//                   uid: uid,
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class ContactBox extends StatelessWidget {
//   String uid;
//   bool isTravel;
//   ContactBox({Key? key, required this.isTravel, required this.uid})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: 410),
//       margin: EdgeInsets.only(top: kDefaultPadding),
//       padding: EdgeInsets.all(kDefaultPadding * 3),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           isTravel == true
//               ? SocalCardMobile(
//                   color: Color(0xFFE8F0F9),
//                   iconSrc: "assets/images/profit.png",
//                   name: 'شاركنا ارباحك من صفقات دبي',
//                   press: () async {
//                     showAlertDialog(context);
//                   },
//                 )
//               : SocalCardMobile(
//                   color: Color(0xFFE8F0F9),
//                   iconSrc: "assets/images/form.png",
//                   name: 'سجل معلوماتك واحجز مقعدك',
//                   press: () async {
//                     var url =
//                         'https://docs.google.com/forms/d/e/1FAIpQLSfiqIMFKVcxePnC0yyHdNG7giKb9Wro2qlAo_sdT6bvhn8SOA/viewform';
//                     if (await canLaunch(url)) {
//                       await launch(
//                         url,
//                         universalLinksOnly: true,
//                       );
//                     }
//                   },
//                 ),
//           SizedBox(height: kDefaultPadding * 2),
//         ],
//       ),
//     );
//   }
// }

// Future<void> addProfit(
//     BuildContext context,
//     TextEditingController profitController,
//     TextEditingController profitPercController) async {
//   var collection = FirebaseFirestore.instance.collection('travel_profits');
//   String userId = FirebaseAuth.instance.currentUser!.uid;
//   if (profitPercController.text == "") profitPercController.text = "0";
//   if (profitController.text == "") profitController.text = "0";

//   await collection.add({
//     'user_id': userId,
//     'profit_percentage': double.parse(profitPercController.text),
//     'profit': double.parse(profitController.text),
//     'archive': false,
//     'createDate': DateTime.now()
//   });

//   Toast.show("تمت المشاركة بنجاح، شكرا", context,
//       duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

//   Future.delayed(Duration(seconds: 1), () {
//     Navigator.of(context).pop(true);
//   });
// }

// showAlertDialog(BuildContext context) {
//   late TextEditingController profitController = TextEditingController();
//   late TextEditingController profitPercController = TextEditingController();

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(
//       "شاركنا الارباح",
//       textAlign: TextAlign.center,
//     ),
//     content: Directionality(
//       textDirection: TextDirection.rtl,
//       child: Form(
//         child: Wrap(
//           spacing: kDefaultPadding * 2.5,
//           runSpacing: kDefaultPadding * 1.5,
//           children: [
//             SizedBox(
//               width: 470,
//               child: TextFormField(
//                 controller: profitPercController,
//                 decoration: InputDecoration(
//                   labelText: "نسبة الأرباح",
//                   hintText: "ادخل نسبة الأرباح ",
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 470,
//               child: TextFormField(
//                 controller: profitController,
//                 decoration: InputDecoration(
//                   labelText: "الأرباح بالدولار",
//                   hintText: "ادخل الأرباح بالدولار",
//                 ),
//               ),
//             ),
//             SizedBox(height: kDefaultPadding * 2),
//             Center(
//               child: FittedBox(
//                 child: DefaultButton(
//                   imageSrc: "assets/images/contact_icon.png",
//                   text: "ارسل!",
//                   press: () {
//                     AwesomeDialog(
//                         width: 600,
//                         padding: EdgeInsets.only(left: 50, right: 50),
//                         context: context,
//                         dialogType: DialogType.WARNING,
//                         animType: AnimType.BOTTOMSLIDE,
//                         title: "تأكيد",
//                         btnOkColor: Color(0xFF189767),
//                         btnOkText: "نعم، أعي ذلك وموافق",
//                         desc:
//                             "هل أدخلت الأرباح كما هي؟ يجب الالتزام بالقواعد جميعها لضمان الوصول للقمة  ",
//                         btnOkOnPress: () {
//                           addProfit(
//                               context, profitController, profitPercController);
//                         }).show();
//                   },
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     actions: [
//       //cancelButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
