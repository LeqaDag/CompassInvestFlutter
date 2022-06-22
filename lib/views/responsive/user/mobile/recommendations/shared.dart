// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget RecommindationContent(int uid, String name, String image, int type,
    double exit_point, double width, double height) {
  String image_type = "";
  if (type == 1) {
    image_type = "assets/images/long.png";
  } else {
    image_type = "assets/images/short.png";
  }

  return Container(
      height: height * 0.08,
      width: double.infinity,
      margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              image.toString().contains(".svg")
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.network(
                        image,
                        height: 40.0,
                        width: 40.0,
                      ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        image,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
              Container(
                width: width * 0.02,
              ),
              Text(
                name.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image_type,
              height: 50.0,
              width: 50.0,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                exit_point.toString(),
                style: const TextStyle(fontSize: 15, color: Color(0xffD90000)),
              ),
            ],
          ),
        ],
      ));
}
