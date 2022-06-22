// ignore_for_file: non_constant_identifier_names

import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'drawer.dart';

class MenuScreen extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  const MenuScreen({
    Key? key,
    required this.about_us,
    required this.soon,
    required this.instgram_link,
    required this.facebook_link,
    required this.website_link,
    required this.privacy,
  }) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      about_us: widget.about_us,
      soon: widget.soon,
      privacy: widget.privacy,
      instgram_link: widget.instgram_link,
      facebook_link: widget.facebook_link,
      website_link: widget.website_link,
    );
  }
}

PreferredSizeWidget DashboardAppBar(BuildContext context, double width) {
  return AppBar(
    leading: IconButton(
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
        icon: const Icon(
          Icons.menu,
          color: whiteColor,
        )),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    foregroundColor: Colors.black45,
    automaticallyImplyLeading: true,
    actions: [
      Container(
        width: width * 0.12,
        margin: EdgeInsets.only(left: width * 0.02, top: width * 0.02),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              image: AssetImage("assets/images/logo.png"), fit: BoxFit.cover),
        ),
      )
    ],
  );
}
