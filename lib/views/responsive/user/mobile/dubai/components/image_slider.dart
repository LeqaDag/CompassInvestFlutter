// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:compass_invest/views/responsive/user/shared/shared.dart';
// import 'package:flutter/material.dart';

// class ImageSliderMobile extends StatelessWidget {
//   ImageSliderMobile({Key? key}) : super(key: key);
//   final List<String> imageList = [
//     "assets/images/dubai/1.jpeg",
//     "assets/images/dubai/2.jpeg",
//     "assets/images/dubai/3.jpeg",
//     "assets/images/dubai/4.jpeg",
//     "assets/images/dubai/5.jpeg",
//     "assets/images/dubai/6.jpeg",
//     "assets/images/dubai/7.jpeg",
//     "assets/images/dubai/8.jpeg",
//     "assets/images/dubai/9.jpeg",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Container(
//       margin: EdgeInsets.all(25),
//       child: CarouselSlider.builder(
//         itemCount: imageList.length,
//         options: CarouselOptions(
//           enlargeCenterPage: true,
//           height: 400,
//           autoPlay: true,
//           autoPlayInterval: Duration(seconds: 3),
//           reverse: false,
//           aspectRatio: 7.0,
//         ),
//         itemBuilder: (context, i, id) {
//           //for onTap to redirect to another screen
//           return GestureDetector(
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: Colors.white,
//                   )),
//               //ClipRRect for image border radius
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   imageList[i],
//                   width: screenSize.width,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return FullImage(
//                   item: imageList[i],
//                 );
//               }));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
