// ignore_for_file: unused_element

import 'package:compassinvest/models/user.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({Key? key}) : super(key: key);

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    User allUsers = User();
    return FutureBuilder<List>(
        future: allUsers.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 20),
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: width * 0.32,
                            height: height * 0.18,
                            margin: EdgeInsets.only(right: width * 0.02),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: const Color(0xff9EB5C2))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: width * 0.03,
                            ),
                            child: Container(
                              width: width * 0.3,
                              height: height * 0.42,
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff17255A),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data![index]["photo_path"]),
                                      fit: BoxFit.cover)),
                              child: Container(
                                width: width * 0.25,
                                height: height * 0.02,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff17255A),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: HeaderTextUser(
                                    "${snapshot.data![index]['fname']} ${snapshot.data![index]['lname']}",
                                    11,
                                    const Color(0xffD5DFE5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]);
              },
            );
          } else {
            return const GFLoader(type: GFLoaderType.ios);
          }
        });
  }
}
