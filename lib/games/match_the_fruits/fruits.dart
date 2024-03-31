import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/games/match_the_fruits/widgets/fruits_slider.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:need_resume/need_resume.dart';
import '../../class/itemModel.dart';

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
    audioPlayer.play(AssetSource(items[0].audio!));
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
    audioPlayer.resume();
  }

  final audioPlayer = AudioPlayer();
  List<MatchGameModel> items = MatchGameModel.fruitsItems;
  CarouselController caro = CarouselController();
  // AudioCache audioCache = AudioCache();

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
              const BackgroundImage(
                image: 'https://img.freepik.com/free-vector/orange-patterned-frame_53876-93816.jpg?w=996&t=st=1658840542~exp=1658841142~hmac=b6f676f59b865293a8ed18827ae0e7f854471a3a1d234ebebf561f7fdb076227',
                isAssetImage: false,
              ),
              const HomeButton(),
              FruitsSlider(caro: caro, player: audioPlayer, items: items),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              // playButton(context),
            ],
          ),
        ),
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
