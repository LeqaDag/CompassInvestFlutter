import 'package:carousel_slider/carousel_slider.dart';
import 'package:compassinvest/models/photo.dart';
import 'package:compassinvest/views/responsive/user/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhotoHome photosData = PhotoHome();

    return FutureBuilder<List>(
        future: photosData.getAllPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: CarouselSlider.builder(
                  itemCount: snapshot.data?.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 7.0,
                  ),
                  itemBuilder: (context, i, id) {
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
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return FullImage(
                            item: snapshot.data![i]['photo_path'].toString(),
                          );
                        }));
                      },
                    );
                  },
                ));
          } else {
            return const GFLoader(type: GFLoaderType.ios);
          }
        });
  }
}
