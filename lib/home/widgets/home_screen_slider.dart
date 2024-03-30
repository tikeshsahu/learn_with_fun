import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_fun/class/home_tile_class.dart';
import 'package:lottie/lottie.dart';

class HomeScreenSlider extends StatelessWidget {
  const HomeScreenSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HomeTile> games = HomeTile.homeTiles;
    
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width,
        //color: Colors.cyan,
        child: Column(
          children: [
            CarouselSlider.builder(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.3,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.6,
                    autoPlayCurve: Curves.fastOutSlowIn),
                itemCount: games.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      if (games[itemIndex].name == 'Animals' ||
                          games[itemIndex].name == 'Fruits' ||
                          games[itemIndex].name == 'Alphabets' ||
                          games[itemIndex].name == 'Numbers' ||
                          games[itemIndex].name == 'Vehicles' ||
                          games[itemIndex].name == 'Professions') {
                        Navigator.pushNamed(context, games[itemIndex].path);
                      } else {
                        () {};
                      }
                    },

                    child: Column(
                      children: [
                        Flexible(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(28.0),
                                child: games[itemIndex].name == 'Animals' ||
                                        games[itemIndex].name == 'Fruits' ||
                                        games[itemIndex].name == 'Alphabets' ||
                                        games[itemIndex].name == 'Numbers' ||
                                        games[itemIndex].name == 'Vehicles' ||
                                        games[itemIndex].name == 'Professions'
                                    ? CachedNetworkImage(
                                      imageUrl: games[itemIndex].image,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:
                                          MediaQuery.of(context).size.width,
                                      fit: BoxFit.fill,
                                    )
                                    : Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            games[itemIndex].image,
                                          )),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2, sigmaY: 2),
                                          child: Container(
                                              alignment: Alignment.center,
                                              color:
                                                  Colors.grey.withOpacity(0.01),
                                              child: Lottie.network(
                                                  'https://assets2.lottiefiles.com/packages/lf20_ur3u8zt5.json')),
                                        ),
                                      ))
                            //),
                            ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 7.5,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              games[itemIndex].name,
                              style: const TextStyle(
                                fontFamily: 'chock',
                                fontSize: 40,
                                color: Color.fromARGB(255, 244, 251, 23),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ));
 
  }
}