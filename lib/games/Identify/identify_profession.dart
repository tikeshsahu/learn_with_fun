import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/profession_class.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class IdentifyProfession extends StatefulWidget {
  static const routeName = 'professions';
  const IdentifyProfession({Key? key}) : super(key: key);

  @override
  State<IdentifyProfession> createState() => _IdentifyProfessionState();
}

class _IdentifyProfessionState extends ResumableState<IdentifyProfession> {
  @override
  void initState() {
    super.initState();
    pros.shuffle();
    player.play(AssetSource(pros[0].pronounciation));
  }

  @override
  void onReady() {
    // Implement your code inside here
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
  }

  List<Professtions> pros = Professtions.pros;
  final player = AudioPlayer();

  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

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
              // Align(
              //   alignment: AlignmentDirectional(0.95, -1.05),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(context, 'proGame');
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Image.asset(
              //         'assets/gui/play.png',
              //         height: 105,
              //         width: 130,
              //       ),
              //     ),
              //   ),
              // ),
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
        imageUrl: 'https://img.freepik.com/premium-vector/suburban-landscape-view-high-rise-buildings-countryside-cartoon-vector-illustration_273525-462.jpg',
        fit: BoxFit.fill,
      ),
    );
  }

  Align slider(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.12, 1),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.26,
        //color: Colors.amber,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  player.play(AssetSource(pros[index].pronounciation));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: pros.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: pros[index].name == 'Farmer' || pros[index].name == 'Astronaut' || pros[index].name == 'Fire Fighter' || pros[index].name == 'Scientist' || pros[index].name == 'Pilot' || pros[index].name == 'Soldier' || pros[index].name == 'Police Man' || pros[index].name == 'Teacher'
                          ? CachedNetworkImage(
                              imageUrl: pros[index].image,
                              fit: pros[index].name == 'Police Man' ? BoxFit.contain : BoxFit.fill,
                              progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                              // CircularProgressIndicator(
                              //     value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : Lottie.network(
                              pros[index].image,
                              fit: BoxFit.fill,
                            ),
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), color: Colors.white
                        //Color(0xFFFFFFF0),
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7.4,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          pros[index].name,
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
}
