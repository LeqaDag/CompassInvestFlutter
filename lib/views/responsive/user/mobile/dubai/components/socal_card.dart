// import 'package:compass_invest/views/user/constants.dart';
// import 'package:flutter/material.dart';

// class SocalCardMobile extends StatefulWidget {
//   const SocalCardMobile({
//     Key? key,
//     required this.iconSrc,
//     required this.name,
//     required this.color,
//     required this.press,
//   }) : super(key: key);

//   final String iconSrc, name;
//   final Color color;
//   final Function() press;

//   @override
//   _SocalCardMobileState createState() => _SocalCardMobileState();
// }

// class _SocalCardMobileState extends State<SocalCardMobile> {
//   bool isHover = false;
//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: InkWell(
//         onTap: widget.press,
//         onHover: (value) {
//           setState(() {
//             isHover = value;
//           });
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           padding: EdgeInsets.symmetric(
//             vertical: kDefaultPadding,
//             horizontal: kDefaultPadding * 0.5,
//           ),
//           decoration: BoxDecoration(
//             color: widget.color,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [if (isHover) kDefaultCardShadow],
//           ),
//           child: Row(
//             children: [
//               Image.asset(
//                 widget.iconSrc,
//                 height: 40,
//                 width: 40,
//               ),
//               SizedBox(width: kDefaultPadding),
//               Text(widget.name),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
