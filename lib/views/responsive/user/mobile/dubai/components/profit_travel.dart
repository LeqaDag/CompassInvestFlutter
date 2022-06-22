// import 'package:compass_invest/classes/travel_profit.dart';
// import 'package:compass_invest/controllers/TravelProfitController.dart';
// import 'package:compass_invest/views/responsive/user/web/components/section_title.dart';

// import 'package:flutter/material.dart';

// import 'profit_card.dart';

// class ProfitForUserSectionTravelMobile extends StatelessWidget {
//   final String uid;
//   ProfitForUserSectionTravelMobile({Key? key, required this.uid})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<TravelProfit> travelProfits;
//     var totalProfits = 0.0;
//     return StreamBuilder<List<TravelProfit>>(
//         stream: TravelProfitController(uid: uid).travelProfitsForUsers,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Container();
//           } else {
//             travelProfits = snapshot.data!;
//             travelProfits.forEach((element) {
//               if (element.archive == false) {
//                 totalProfits += element.profit!;
//               }
//             });

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SectionTitle(
//                   title: " شاركنا الارباح",
//                   subTitle: " ",
//                   color: Color(0xFF07E24A),
//                 ),
//                 Container(
//                     margin: EdgeInsets.all(10),
//                     child: TravelProfitCard(numOfExp: totalProfits.toString())),
//               ],
//             );
//           }
//         });
//   }
// }
