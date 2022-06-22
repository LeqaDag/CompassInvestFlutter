import 'package:compassinvest/models/photo.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';
import 'package:flutter/material.dart';

class PhotoAlbum extends StatelessWidget {
  final List<String> imgArray;

  const PhotoAlbum({Key? key, required this.imgArray}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotoHome photosData = PhotoHome();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "صورنا",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder<List>(
              future: photosData.getAllPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      margin: const EdgeInsets.all(5),
                      child: GridView.builder(
                        primary: false,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          //for onTap to redirect to another screen
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              //ClipRRect for image border radius
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  snapshot.data![i]['photo_path'],
                                  width: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return FullImage(
                                  item: snapshot.data![i]['photo_path']
                                      .toString(),
                                );
                              }));
                            },
                          );
                        },
                        
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                      ));
                } else {
                  return Container();
                }
              }),

          // GridView.count(
          //     primary: false,
          //     padding: const EdgeInsets.symmetric(vertical: 15.0),
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //     crossAxisCount: 3,
          //     children: imgArray
          //         .map((item) => GestureDetector(
          //               onTap: () {
          //                 // Navigator.push(context,
          //                 //     MaterialPageRoute(builder: (_) {
          //                 //   return FullImage(
          //                 //     item: item,
          //                 //   );
          //                 // }));
          //               },
          //               child: Container(
          //                   height: 100,
          //                   decoration: BoxDecoration(
          //                       borderRadius: const BorderRadius.all(
          //                           Radius.circular(4.0)),
          //                       image: DecorationImage(
          //                           image: AssetImage(item),
          //                           fit: BoxFit.cover))),
          //             ))
          //         .toList()),
        )
      ],
    );
  }
}
