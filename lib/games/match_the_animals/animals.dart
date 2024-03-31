import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/games/match_the_animals/widget/animals_slider.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:need_resume/need_resume.dart';
import '../../class/itemModel.dart';

class Animals extends StatefulWidget {
  static const routeName = 'animals';
  const Animals({Key? key}) : super(key: key);

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends ResumableState<Animals> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

  @override
  void initState() {
    super.initState();
    items.shuffle();
    player.play(AssetSource(items[0].audio!));
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

  // @override
  // dispose() {
  //   super.dispose();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //   ]);
  // }

  final player = AudioPlayer();
  List<MatchGameModel> items = MatchGameModel.animalsItems;
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
              const BackgroundImage(image: 'https://img.freepik.com/free-vector/organic-flat-jungle-background_23-2148952811.jpg?w=996&t=st=1658824128~exp=1658824728~hmac=c65dbac5c9839e812060d8154ca4eb6e3d2745082595ee999554873575c76a5a', isAssetImage: false),
              const HomeButton(),
              AnimalsSlider(caro: caro, player: player, items: items),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              //playButton(context),
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
