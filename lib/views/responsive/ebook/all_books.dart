// ignore_for_file: unused_element, non_constant_identifier_names
import 'package:compassinvest/api/pdf_api.dart';
import 'package:compassinvest/models/ebook.dart';
import 'package:compassinvest/views/responsive/ebook/free_pdf_ebook.dart';
import 'package:compassinvest/views/responsive/ebook/paid_ebook.dart';
import 'package:compassinvest/views/responsive/ebook/user_pdf_ebook.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllEbooksPage extends StatefulWidget {
  final String about_us;
  final String soon;
  final String instgram_link;
  final String facebook_link;
  final String website_link;
  final String privacy;
  final int userId;
  final String fname;
  final String lname;
  final String image;
   final String email;
  final int phone;
  const AllEbooksPage(
      {Key? key,
      required this.about_us,
      required this.soon,
      required this.instgram_link,
      required this.facebook_link,
      required this.website_link,
      required this.privacy,
      required this.userId,
      required this.fname,
      required this.lname,
      required this.image,
      required this.phone,
      required this.email})
      : super(key: key);

  @override
  State<AllEbooksPage> createState() => _AllEbooksPageState();
}

class _AllEbooksPageState extends State<AllEbooksPage>
    with TickerProviderStateMixin {
  late var free = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Ebook allEbooks = Ebook();
    return FutureBuilder<List>(
      future: allEbooks.getAllEbooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
             width: width,
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              height: height * 0.4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Bounceable(
                          onTap: () async {
                            free = snapshot.data![index]["free"];
                            final url = snapshot.data![index]["url"];
                            final file = await PDFApi.loadNetwork(url);
                            free == 1 && widget.userId == 0
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            FreeEbookDetailsPage(
                                              file: file,
                                              about_us: widget.about_us,
                                              soon: widget.soon,
                                              privacy: widget.privacy,
                                              instgram_link:
                                                  widget.instgram_link,
                                              facebook_link:
                                                  widget.facebook_link,
                                              website_link: widget.website_link,
                                            )))
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PaidEbookDetailsPage(
                                              about_us: widget.about_us,
                                              soon: widget.soon,
                                              instgram_link:
                                                  widget.instgram_link,
                                              facebook_link:
                                                  widget.facebook_link,
                                              website_link: widget.website_link,
                                              privacy: widget.privacy,
                                            )));

                            widget.userId != 0
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserEbookDetailsPage(
                                              file: file,
                                              about_us: widget.about_us,
                                              soon: widget.soon,
                                              privacy: widget.privacy,
                                              instgram_link:
                                                  widget.instgram_link,
                                              facebook_link:
                                                  widget.facebook_link,
                                              website_link: widget.website_link,
                                              userId: widget.userId,
                                              fname: widget.fname,
                                              lname: widget.lname,
                                              image: widget.image,
                                              phone: widget.phone,
                                              email: widget.email,
                                            )))
                                : Container();
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: width * 0.01,
                                ),
                                child: Container(
                                  width: width * 0.6,
                                  height: height * 0.55,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xff17255A),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data![index]["ebook_path"]),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                    width: width * 0.6,
                                    height: height * 0.06,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff17255A)
                                            .withOpacity(0.5),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(25.0),
                                          bottomRight: Radius.circular(25.0),
                                        )),
                                    child: HeaderTextUser(
                                        "${snapshot.data![index]['title']}",
                                        17,
                                        const Color(0xff17255A)),
                                  ),
                                ),
                              ),
                              snapshot.data![index]['free'] == 0 &&
                                      widget.userId == 0
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: width * 0.05,
                                          right: width * 0.05),
                                      child: const Icon(
                                        FontAwesomeIcons.crown,
                                        color: Color(0xff17255A),
                                      ))
                                  : Container()
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.05,
                        ),
                      ],
                    );
                  }));
        } else {
          return Container();
        }
      },
    );
  }
}
