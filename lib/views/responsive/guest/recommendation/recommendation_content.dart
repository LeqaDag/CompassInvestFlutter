// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class RecommendationContents {
  final String title;
  final String image;
  final String desc;

  RecommendationContents(
      {required this.title, required this.image, required this.desc});
}

List<RecommendationContents> contents = [
  RecommendationContents(
    title: "توصيات عالية الربح",
    image: "assets/images/reco1.png",
    desc: "الوصول الى ربح عال يحتاج الى تدقيق ودراسة للعملات قبل الدخول فيها",
  ),
  RecommendationContents(
    title: "طريق العملات الرقمية محفوف بالمخاطر والجرأة",
    image: "assets/images/reco3.png",
    desc: "مع المتابعة وحصولك على توصيات جاهزة يمكنك ان تربح بوقت قياسي",
  ),
  RecommendationContents(
    title: "جاهز؟",
    image: "assets/images/invest.png",
    desc: "اتخذ قرارا جريئا وسريعا لتغير نمط حياتك، انضم الان",
  ),
];
