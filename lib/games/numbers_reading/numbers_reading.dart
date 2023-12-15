import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxShadow;
//import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/numbers_class.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';

class NumbersReading extends StatefulWidget {
  static const routeName = 'numbersreading';
  const NumbersReading({Key? key}) : super(key: key);

  @override
  State<NumbersReading> createState() => _NumbersReadingState();
}

class _NumbersReadingState extends State<NumbersReading> {
  @override
  void initState() {
    super.initState();
    player.play(AssetSource(numbers[0].pronounciation));
  }

  List<NumbersLearn> numbers = NumbersLearn.numbers;
  // AudioCache audioCache = AudioCache();
  final player = AudioPlayer();
  CarouselController caro = CarouselController();

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

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
          bgImage(context),
          homeButton(context),
          SliderLeftButton(
            caro: caro,
          ),
          SliderRightButton(caro: caro),
          caroSlider(context)
        ]),
      ))),
    );
  }

  Align caroSlider(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, -0.20),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.35,
        height: MediaQuery.of(context).size.height / 1.3,
        //color: Colors.blue,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  player.play(AssetSource(numbers[index].pronounciation));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: numbers.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 2.3,
                      width: MediaQuery.of(context).size.width / 4.5,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          numbers[index].num,
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              fontSize: 130,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Freshman'),
                        ),
                      )),
                  const Text(
                    '-',
                    style: TextStyle(
                        fontFamily: 'Chicle',
                        fontSize: 35,
                        color: Colors.black87),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: CachedNetworkImage(
                        imageUrl: numbers[index].dialogImage,
                        progressIndicatorBuilder: (context, url,
                                downloadProgress) =>
                            const SpinKitDualRing(color: Colors.amberAccent),
                        // CircularProgressIndicator(
                        //     value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.fill),
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
          Navigator.pop(context, 'home');
        },
        child: Image.asset(
          'assets/gui/homeButton.png',
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 10,
        ),
      ),
    );
  }

  CachedNetworkImage bgImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://img.freepik.com/premium-vector/colorful-playful-numbers-background-perfect-educational-presentation-background-kids_91515-252.jpg?w=1060',
      //'https://png.pngtree.com/thumb_back/fw800/back_pic/03/87/56/9757d25d61d31ad.jpg',
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
