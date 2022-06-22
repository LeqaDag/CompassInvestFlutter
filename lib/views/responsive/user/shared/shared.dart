// ignore_for_file: use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, must_be_immutable

import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

class HeaderTextUser extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const HeaderTextUser(this.text, this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color,
          ),
    );
  }
}

class FullImage extends StatelessWidget {
  String item;
  FullImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      child: Hero(
        tag: "customTag",
        child: Container(
          alignment: Alignment.center,
          child: Image.network(
            item,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TradingLink extends StatefulWidget {
  const TradingLink({
    Key? key,
    required this.press,
    required this.iconSrc,
  }) : super(key: key);

  final String iconSrc;
  final Function() press;

  @override
  _TradingLinkState createState() => _TradingLinkState();
}

class _TradingLinkState extends State<TradingLink> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding / 2,
            horizontal: kDefaultPadding * 3.5,
          ),
          child: Row(
            children: [
              Image.asset(
                widget.iconSrc,
                height: 50,
                width: 50,
              ),
              const SizedBox(width: kDefaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class SocalCardMobile extends StatefulWidget {
  const SocalCardMobile({
    Key? key,
    required this.iconSrc,
    required this.name,
    required this.color,
    required this.press,
  }) : super(key: key);

  final String iconSrc, name;
  final Color color;
  final Function() press;

  @override
  _SocalCardMobileState createState() => _SocalCardMobileState();
}

class _SocalCardMobileState extends State<SocalCardMobile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding * 0.5,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [if (isHover) kDefaultCardShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.iconSrc,
                height: 40,
                width: 40,
              ),
              Text(widget.name),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  final String title, subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      // constraints: BoxConstraints(maxWidth: 1110),
      height: 120,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: kDefaultPadding * 0.1),
            padding: const EdgeInsets.only(bottom: 72),
            width: 8,
            height: 100,
            color: Colors.black,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      color: kTextColor,
                      fontSize: 12),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.imageSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String imageSrc, text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFE8F0F9),
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding,
          horizontal: kDefaultPadding * 2.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: press,
      child: Row(
        children: [
          Image.asset(imageSrc, height: 40),
          const SizedBox(width: kDefaultPadding),
          Text(
            text,
            style: const TextStyle(color: Color(0xff17255A)),
          ),
        ],
      ),
    );
  }
}
