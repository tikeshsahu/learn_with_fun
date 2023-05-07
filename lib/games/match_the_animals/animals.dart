import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

import 'itemModel.dart';

class Animals extends StatefulWidget {
  static const routeName = 'animals';
  const Animals({Key key}) : super(key: key);

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends ResumableState<Animals> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  void initState() {
    super.initState();
    items.shuffle();
    audioCache.play(items[0].audio);
  }

  void onReady() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<MatchGameModel> items = MatchGameModel.animalsItems;
  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              backgroundImage(context),
              homeButton(context),
              slider(context),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              playButton(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox backgroundImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CachedNetworkImage(
        imageUrl:
            'https://img.freepik.com/free-vector/organic-flat-jungle-background_23-2148952811.jpg?w=996&t=st=1658824128~exp=1658824728~hmac=c65dbac5c9839e812060d8154ca4eb6e3d2745082595ee999554873575c76a5a',
        //'assets/animalBack.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Align homeButton(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.95, -0.95),
      child: GestureDetector(
        onTap: () {
          // Navigator.of(context)
          //.pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/homu.png',
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width / 10,
          ),
        ),
      ),
    );
  }

  Align slider(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.12, 1),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.26,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  audioCache.play(items[index].audio);
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    width: MediaQuery.of(context).size.width / 2,
                    child: GestureDetector(
                      child: ClipRRect(
                        child: items[index].name == 'Cow' ||
                                items[index].name == 'Elephant' ||
                                items[index].name == 'Penguin'
                            ? CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: items[index].image,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        const SpinKitDualRing(
                                            color: Colors.amberAccent),
                                // CircularProgressIndicator(
                                //     value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  size: 35,
                                ),
                              )
                            : Lottie.network(items[index].image,
                                fit: items[index].name == 'Cat'
                                    ? BoxFit.contain
                                    : BoxFit.contain),
                      ),
                      onTap: () {
                        audioCache.play(items[index].music);
                      },
                    ),
                    decoration: BoxDecoration(
                      //color: Color(0xFFFFFFF0),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7.5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items[index].name,
                          style: TextStyle(
                            fontFamily: 'party',
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 10.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(26),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Align playButton(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.95, -1.05),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'matchAnimals');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/play.png',
            height: 105,
            width: 130,
          ),
        ),
      ),
    );
  }
}
