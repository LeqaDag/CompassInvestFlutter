// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// // ignore: must_be_immutable
// class CreditCardPage extends StatefulWidget {
//   String course_id;
//   String name;
//   CreditCardPage({Key? key, required this.course_id, required this.name})
//       : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return CreditCardPageState();
//   }
// }

// class CreditCardPageState extends State<CreditCardPage> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Color(0xffffffff),
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           title: Text(widget.name),
//           automaticallyImplyLeading: true,
//           centerTitle: true,
//           backgroundColor: Color(0xffffffff),

//           // backgroundColor: Colors.transparent,
//           foregroundColor: Color(0xff17255A),
//         ),
//         resizeToAvoidBottomInset: true,
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               CreditCardWidget(
//                 cardBgColor: Color(0xff17255A),
//                 cardNumber: cardNumber,
//                 expiryDate: expiryDate,
//                 cardHolderName: cardHolderName,
//                 cvvCode: cvvCode,
//                 showBackView: isCvvFocused,
//                 obscureCardNumber: true,
//                 obscureCardCvv: true,
//                 onCreditCardWidgetChange: (CreditCardBrand) {},
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       CreditCardForm(
//                         formKey: formKey,
//                         onCreditCardModelChange: onCreditCardModelChange,
//                         obscureCvv: true,
//                         obscureNumber: true,
//                         cardNumberDecoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'الرقم',
//                           hintText: 'XXXX XXXX XXXX XXXX',
//                         ),
//                         expiryDateDecoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'تاريخ الانتهاء',
//                           hintText: 'XX/XX',
//                         ),
//                         cvvCodeDecoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'CVV',
//                           hintText: 'XXX',
//                         ),
//                         cardHolderDecoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'اسم صاحب البطاقة',
//                         ),
//                         themeColor: Color(0xff17255A),
//                         cardHolderName: cardHolderName,
//                         cardNumber: cardNumber,
//                         cvvCode: cvvCode,
//                         expiryDate: expiryDate,
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: const Color(0xff1b447b),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(8),
//                           child: const Text(
//                             'تأكيد',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             print('valid!');

//                             _showValidDialog(context, "Valid",
//                                 "Your card successfully valid !!!");
//                           } else {
//                             print('invalid!');
//                           }
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   AlertDialog _showValidDialog(
//     BuildContext context,
//     String title,
//     String content,
//   ) {
//     return AlertDialog(
//       backgroundColor: Color(0xff1b447b),
//       title: Text(title),
//       content: Text(content),
//       actions: [
//         ElevatedButton(
//             child: Text(
//               "Ok",
//               style: TextStyle(fontSize: 18, color: Colors.cyan),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             }),
//       ],
//     );
//   }

//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }
