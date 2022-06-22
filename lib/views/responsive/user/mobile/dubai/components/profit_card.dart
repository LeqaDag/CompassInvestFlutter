// import 'package:compass_invest/views/user/constants.dart';
// import 'package:flutter/material.dart';

// class TravelProfitCard extends StatelessWidget {
//   const TravelProfitCard({
//     Key? key,
//     required this.numOfExp,
//   }) : super(key: key);

//   final String numOfExp;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       // margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//       padding: EdgeInsets.all(kDefaultPadding),
//       height: 240,
//       width: screenWidth * 1.2,
//       decoration: BoxDecoration(
//         color: Color(0xFFF7E8FF),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: Color(0xffD5DFE5),
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 3),
//               blurRadius: 6,
//               color: Color(0xff17255A).withOpacity(0.25),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               children: [
//                 Text(
//                   numOfExp,
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     foreground: Paint()
//                       ..style = PaintingStyle.stroke
//                       ..strokeWidth = 6
//                       ..color = Color(0xffD5DFE5).withOpacity(0.5),
//                     shadows: [
//                       BoxShadow(
//                         offset: Offset(0, 5),
//                         blurRadius: 10,
//                         color: Color(0xff17255A).withOpacity(0.5),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   numOfExp,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 40,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: kDefaultPadding / 2),
//             Text(
//               "\$",
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Color(0xff17255A),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
