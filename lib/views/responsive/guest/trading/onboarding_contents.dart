// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "التداول مع كومباس",
    image: "assets/images/ui.png",
    desc: "تذكر أن الوصول الى التميز ليس له حدود، عائلة كومباس انفست معك!",
  ),
  OnboardingContents(
    title: "طريق التداول محفوف بالمخاطر والجرأة",
    image: "assets/images/profit-share.png",
    desc: "مع المتابعة يمكنك تقليل المخاطر والتداول بذهن صاف",
  ),
  OnboardingContents(
    title: "طريق الالف يبدأ بخطوة",
    image: "assets/images/Intreaction_design.png",
    desc: "لا نقوم بمضاعفة اموالك وحسب، بل كسب مهارات جديدة ",
  ),
  OnboardingContents(
    title: "جاهز؟",
    image: "assets/images/invest.png",
    desc: "اتخذ قرارا جريئا وسريعا لتغير نمط حياتك، انضم الان",
  ),
];
