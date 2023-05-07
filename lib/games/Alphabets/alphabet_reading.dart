import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';
import '../../class/alphabet_class.dart';

class AlphabetsLearning extends StatefulWidget {
  static const routeName = 'alphaReading';
  const AlphabetsLearning({Key key}) : super(key: key);

  @override
  State<AlphabetsLearning> createState() => _AlphabetsLearningState();
}

class _AlphabetsLearningState extends ResumableState<AlphabetsLearning> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    audioCache.play("AA.mp3");
  }

  void onReady() {
    // Implement your code inside here
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

  AudioCache audioCache = AudioCache();
  bool loading;

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  List<AlphabetsReadingModel> alphabets = AlphabetsReadingModel.alphabets;

  CarouselController caro = CarouselController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
              child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          backgroundImage(context),
          greenBoardImage(context),
          homeButton(context),
          SliderLeftButton(caro: caro),
          SliderRightButton(caro: caro),
          slider(context)
        ]),
      ))),
    );
  }

  Align slider(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, -0.24),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.45,
        //color: Colors.black38,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  audioCache.play(alphabets[index].pronounciation);
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: alphabets.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 140,
                    //color: Colors.amber,
                    child: GestureDetector(
                      child: Image.asset(
                        alphabets[index].image,
                        fit: alphabets[index].title == 'W' ||
                                alphabets[index].description == 'I'
                            ? BoxFit.contain
                            : BoxFit.cover,
                      ),
                      onTap: () {
                        // setState(() {
                        //   alphabets[index].itemIsPressed =
                        //       !alphabets[index].itemIsPressed;
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 28,
                  ),
                  const Text(
                    'For',
                    style: TextStyle(
                        fontFamily: 'Chicle',
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 24,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width / 3.2,
                    child: alphabets[index].description == 'Z  for  Zebra'
                        ? CachedNetworkImage(
                            imageUrl: alphabets[index].forImage,
                            fit: BoxFit.fill,
                          )
                        : Lottie.network(
                            alphabets[index].forImage,
                            fit: BoxFit.fill,
                            errorBuilder: (context, url, error) => const Icon(
                              Icons.error,
                              size: 30,
                            ),
                          ),
                    decoration: BoxDecoration(
                      //color: Color(0xFFFFFFF0),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Align homeButton(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.95, -0.95),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/gui/homu.png',
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 10,
        ),
      ),
    );
  }

  Align greenBoardImage(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.00),
      child: Image.asset(
        'assets/Alphabets/bb.png',
        height: MediaQuery.of(context).size.height / 1.01,
        width: MediaQuery.of(context).size.width / 1.15,
        fit: BoxFit.fill,
      ),
    );
  }

  Image backgroundImage(BuildContext context) {
    return Image.network(
      'https://png.pngtree.com/thumb_back/fw800/back_pic/03/87/56/9757d25d61d31ad.jpg',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
