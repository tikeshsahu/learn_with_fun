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
import '../match_the_animals/itemModel.dart';

class Fruits extends StatefulWidget {
  static const routeName = 'fruits';
  const Fruits({Key? key}) : super(key: key);

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends ResumableState<Fruits> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

  @override
  void initState() {
    super.initState();
    items.shuffle();
    //audioCache.play(items[0].audio!);
  }

  @override
  void onReady() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // audioPlayer.resume();
  }

  List<MatchGameModel> items = MatchGameModel.fruitsItems;
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
              slide(context),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              // playButton(context),
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
        imageUrl: 'https://img.freepik.com/free-vector/orange-patterned-frame_53876-93816.jpg?w=996&t=st=1658840542~exp=1658841142~hmac=b6f676f59b865293a8ed18827ae0e7f854471a3a1d234ebebf561f7fdb076227',
        fit: BoxFit.fill,
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

  Align slide(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0.80),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.49,
        height: MediaQuery.of(context).size.height / 1.395,
        //color: Colors.amber,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  //audioCache.play(items[index].audio!);
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.02,
                    width: MediaQuery.of(context).size.width / 2,
                    //color: Color(0xFFFFFFF0),
                    child: GestureDetector(
                      child: ClipRRect(
                        child: items[index].name == 'Apple' || items[index].name == 'Grapes' || items[index].name == 'Strawberry' || items[index].name == 'Cherry'
                            // || items[index].name == 'Watermelon'
                            // || items[index].name == 'Orange'
                            ? CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: items[index].image,
                                progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                                // CircularProgressIndicator(
                                //     value: downloadProgress.progress),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              )
                            : Lottie.network(items[index].image, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
          Navigator.pushNamed(context, 'matchFruits');
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
