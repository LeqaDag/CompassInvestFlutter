// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, non_constant_identifier_names
import 'package:compassinvest/services/auth.dart';
import 'package:compassinvest/views/responsive/guest/home/home.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/about-us.dart';
import 'package:compassinvest/views/responsive/user/mobile/home/home.dart';
import 'package:compassinvest/views/responsive/user/mobile/profile/profile_page.dart';
import 'package:compassinvest/views/responsive/user/mobile/recommendations/recommendation.dart';
import 'package:compassinvest/views/responsive/user/mobile/trading/trading.dart';
import 'package:compassinvest/views/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserHome extends StatefulWidget {
  const UserHome(
      {Key? key,
      required this.about_us,
      required this.soon,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link,
      required this.privacy,
      required this.fname,
      required this.lname,
      required this.image,
      required this.email,
      required this.uid,
      required this.phone})
      : super(key: key);

  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;

  final String fname;
  final String lname;
  final String image;
  final String email;
  final int uid;
  final int phone;
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      // Content for HOME PAGE

      HomeScreen(
        about_us: widget.about_us,
        soon: widget.soon,
        privacy: widget.privacy,
        instgram_link: widget.instgram_link,
        facebook_link: widget.facebook_link,
        website_link: widget.website_link,
        fname: widget.fname,
        lname: widget.lname,
        image: widget.image,
        uid: widget.uid,
        phone: widget.phone,
        email: widget.email,
      ),

      RecommendationsUsers(
        uid: widget.uid,
      ),

      TradingPageUsers(
        uid: widget.uid,
      ),

      ProfileScreen(
        fname: widget.fname,
        lname: widget.lname,
        image: widget.image,
        uid: widget.uid,
        email: widget.email,
        phone: widget.phone,
      ),

      AboutUsPage(
        about_us: widget.about_us,
        soon: widget.soon,
        privacy: widget.privacy,
        instgram_link: widget.instgram_link,
        facebook_link: widget.facebook_link,
        website_link: widget.website_link,
      ),
    ];

    return Directionality(
        textDirection: TextDirection.rtl,
        child: 
        
        // Consumer<Auth>(builder: (context, auth, child) {
        //   if (!auth.authenticated) {
        //     return GuestDashBoard(
        //       about_us: widget.about_us,
        //       soon: widget.soon,
        //       privacy: widget.privacy,
        //       instgram_link: widget.instgram_link,
        //       facebook_link: widget.facebook_link,
        //       website_link: widget.website_link,
        //     );
        //   } else {
        //     return 
            
            Scaffold(
                extendBodyBehindAppBar: true,
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xffD5DFE5),
                  selectedFontSize: 15,
                  selectedItemColor: mainColor,
                  selectedIconTheme: IconThemeData(color: mainColor, size: 40),
                  unselectedItemColor: mainColor.withOpacity(0.5),
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_rounded), label: "الرئيسية"),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.travel_explore), label: "سافر معنا"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.recommend), label: "التوصيات"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on),
                        label: "الطريق للـ 10k"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "الحساب"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.info), label: "من نحن"),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
                body: _pages.elementAt(_selectedIndex))
        //   }
        // })
        );
  }
}
