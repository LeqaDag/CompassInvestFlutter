
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

class ExperienceCardMobile extends StatelessWidget {
  const ExperienceCardMobile({
    Key? key,
    required this.numOfExp,
  }) : super(key: key);

  final String numOfExp;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      height: 240,
      width: screenWidth * 1.6,
      decoration: BoxDecoration(
        color: const Color(0xff17255A).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xffD5DFE5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 6,
              color: const Color(0xff17255A).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  numOfExp,
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = const Color(0xffD5DFE5).withOpacity(0.5),
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        color: const Color(0xff17255A).withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  numOfExp,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: kDefaultPadding / 2),
            const Text(
              "\$",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff17255A),
              ),
            )
          ],
        ),
      ),
    );
  }
}
