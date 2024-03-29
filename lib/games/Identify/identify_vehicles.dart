import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/class/vehicle_class.dart';
import 'package:learn_with_fun/games/Identify/widgets/identify_vehi_slider.dart';
import 'package:learn_with_fun/widgets/background_image.dart';
import 'package:learn_with_fun/widgets/home_button.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:need_resume/need_resume.dart';

class IdentifyVehicles extends StatefulWidget {
  static const routeName = 'vehicles';
  const IdentifyVehicles({Key? key}) : super(key: key);

  @override
  State<IdentifyVehicles> createState() => _IdentifyVehiclesState();
}

class _IdentifyVehiclesState extends ResumableState<IdentifyVehicles> {
  @override
  void initState() {
    super.initState();
    gaddi.shuffle();
    player.play(AssetSource(gaddi[0].audio));
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
  List<Vehicles> gaddi = Vehicles.gaddi;
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
              const BackgroundImage(image: 'https://img.freepik.com/free-vector/street-side-scene-with-red-telephone-box-scene_1308-45338.jpg?w=1060&t=st=1659095260~exp=1659095860~hmac=cbedfed98ff98b26fcf70f2f180a140310ad8181f1251d17ed5b17da8fa717ac', isAssetImage: false),
              const HomeButton(),
              IdentifyVehicleSlider(caro: caro, player: player, gaddi: gaddi),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              playButton(context),
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
          Navigator.pushNamed(context, 'vehicleGame');
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
