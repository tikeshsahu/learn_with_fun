import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/class/profession_class.dart';
import 'package:learn_with_fun/games/Identify/widgets/identify_prof_slider.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
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

  final player = AudioPlayer();
  List<Professtions> pros = Professtions.pros;
  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              const BackgroundImage(
                isAssetImage: false,
                image: 'https://img.freepik.com/premium-vector/suburban-landscape-view-high-rise-buildings-countryside-cartoon-vector-illustration_273525-462.jpg'),
              const HomeButton(),
              IdentifyProfessionSlider(caro: caro, player: player, pros: pros),
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

  // Align homeButton(BuildContext context) {
  //   return Align(
  //     alignment: const AlignmentDirectional(-0.95, -0.95),
  //     child: GestureDetector(
  //       onTap: () {
  //         Navigator.pop(context);
  //       },
  //       child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Image.asset(
  //           'assets/gui/homu.png',
  //           height: size.height / 5.5,
  //           width: size.width / 10,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
