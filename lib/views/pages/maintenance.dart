// ignore_for_file: prefer_const_constructors

import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void dispose() {
    _lottieAnimation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 2))
        .then(
          (value) => Future.delayed(const Duration(seconds: 3)).then(
            (value) => _lottieAnimation.forward().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const FixedMaintenancePage()),
                      (route) => false),
                ),
          ),
        );
    if (!mounted) return;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderTextUser(
              "التطبيق تحت الصيانة، شكرا لتفهمك", 18, Color(0xff17255A)),
          Image.asset(
            "assets/images/invest.png",
            width: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: transitionDuration,
                curve: Curves.fastOutSlowIn,
                style: TextStyle(
                  color: const Color(0xFF17255A),
                  fontSize: !expanded ? _bigFontSize : 50,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
                child: const Text(
                  "C",
                ),
              ),
              AnimatedCrossFade(
                firstCurve: Curves.fastOutSlowIn,
                crossFadeState: !expanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: transitionDuration,
                firstChild: const Text(""),
                secondChild: _logoRemainder(),
                alignment: Alignment.centerLeft,
                sizeCurve: Curves.easeInOut,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "OMPASSINVEST",
          style: TextStyle(
            color: Color(0xFF17255A),
            fontSize: 30,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        LottieBuilder.asset(
          'assets/json/maintenance.json',
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 100,
          width: 100,
          controller: _lottieAnimation,
        )
      ],
    );
  }
}

class FixedMaintenancePage extends StatelessWidget {
  const FixedMaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderTextUser(
                "عذرا! التطبيق تحت الصيانة", 18, Color(0xff17255A)),
            HeaderTextUser("كن صبورا معنا لضمان حصولك على افضل خدمات التطبيق",
                15, Color(0xff17255A).withOpacity(0.6)),
            Image.asset(
              "assets/gif/maintenance1.gif",
              width: 240,
            ),
          ],
        ));
  }
}
