import 'package:compassinvest/views/responsive/user/mobile/recommendations/recommendation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedAppBar extends StatelessWidget {
  AnimationController colorAnimationController;
  Function onPressed;
  String image;
  String fname;
  String lname;
  AnimatedAppBar(
      {Key? key,
      required this.colorAnimationController,
      required this.onPressed,
      required this.image,
      required this.fname,
      required this.lname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: AnimatedBuilder(
        animation: colorAnimationController,
        builder: (context, child) => AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(image),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0.0,
          title: Row(
            children: <Widget>[
              const Text(
                "أهلا ",
                style: TextStyle(
                    color: Color(0xff17255A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
              Text(
                fname,
                style: const TextStyle(
                    color: Color(0xff17255A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NotificationBadge extends StatelessWidget {
  int totalNotifications;
  int uid;
  NotificationBadge({Key? key, required this.totalNotifications, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 18,
          right: 18,
          child: Icon(
            Icons.notifications,
            color: Color(0xff17255A),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (totalNotifications > 0) {
              totalNotifications = 0;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecommendationsUsers(uid: uid)),
              );
            } else {}
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: const Color(0xff17255A).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  '$totalNotifications',
                  style:
                      const TextStyle(color: Color(0xff17255A), fontSize: 11),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
