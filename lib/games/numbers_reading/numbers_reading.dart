import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxShadow;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/numbers_class.dart';
import 'package:learn_with_fun/games/numbers_reading/widgets/numbers_slider.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
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
          const BackgroundImage(image: 'https://img.freepik.com/premium-vector/colorful-playful-numbers-background-perfect-educational-presentation-background-kids_91515-252.jpg?w=1060', isAssetImage: false), 
          const HomeButton(), 
          SliderLeftButton(caro: caro), 
          SliderRightButton(caro: caro), 
          NumbersReadingSlider(caro: caro, player: player, numbers: numbers)
        ]),
      ))),
    );
  }
}
