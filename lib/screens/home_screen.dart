import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/class/home_tile_class.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class Home extends StatefulWidget {
  static const routename = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends ResumableState<Home> {

  @override
  void onReady() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
    ]);
    // audioPlayer.resume();
  }

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  List<HomeTile> games = HomeTile.homeTiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: 
              // CachedNetworkImage(
              //   imageUrl:
              //       //'https://i.pinimg.com/originals/c4/b5/07/c4b5076a2a215e0b6d341a3f399ccf99.jpg',
              //       'https://img.freepik.com/free-vector/color-seamless-space-pattern_102902-2360.jpg?t=st=1658496795~exp=1658497395~hmac=575a76b85673b0c448f5332643faa5b7904b99835c4d0683e09bce54db8d8f4f&w=996',
              //   fit: BoxFit.fill,
              // )
              Image.asset(
                'assets/home_bg.png',
                fit: BoxFit.fill,)
              ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8.5,
                width: MediaQuery.of(context).size.width,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 18),
              slider(context),
            ],
          ),
        ]),
      ),
    );
  }

  SizedBox slider(BuildContext context) {
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
                        pushNamed(context, games[itemIndex].path);
                      } else {
                        () {};
                      }
                    },

                    ///mnm
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
                          //color: Colors.amber,
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
