import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:learn_with_fun/games/Alphabets/widgets/alphabets_slider.dart';
import 'package:learn_with_fun/games/Alphabets/widgets/green_board_widget.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:need_resume/need_resume.dart';

class AlphabetsLearning extends StatefulWidget {
  static const routeName = 'alphaReading';
  const AlphabetsLearning({Key? key}) : super(key: key);

  @override
  State<AlphabetsLearning> createState() => _AlphabetsLearningState();
}

class _AlphabetsLearningState extends ResumableState<AlphabetsLearning> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    player.play(AssetSource("AA.mp3"));
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
  }

  AudioCache audioCache = AudioCache();
  final player = AudioPlayer();
  bool loading = false;

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

  CarouselController caro = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      // PopScope
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
              child: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(children: [
          const BackgroundImage(image: 'assets/Alphabets/alphabetReadingBG.png', isAssetImage: true), 
          const GreenBoardWidget(), 
          const HomeButton(), SliderLeftButton(caro: caro), SliderRightButton(caro: caro), 
          AlphabetSlider(caro: caro, player: player)]),
      ))),
    );
  }
}
