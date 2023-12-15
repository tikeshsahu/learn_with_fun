import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/gaddi_class.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';
import 'dart:math';

class VehicleGame extends StatefulWidget {
  static const routeName = 'vehicleGame';
  const VehicleGame({Key? key}) : super(key: key);

  @override
  State<VehicleGame> createState() => _VehicleGameState();
}

class _VehicleGameState extends ResumableState<VehicleGame> {
  @override
  void initState() {
    super.initState();
    initGame();
    shuffleAndSetAnswer();
  }

  @override
  void onReady() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  int ansIndex = 0;
  List<Gaddi> vehicles = Gaddi.vehicles;

  shuffleAndSetAnswer() {
    vehicles.shuffle();
    var newRandom = Random();
    var random = 1 + newRandom.nextInt(4 - 1);
    ansIndex = random;
  }

  replay() {
    setState(() {
      score = 0;
      gameOver = false;
      shuffleAndSetAnswer();
    });
  }

  final player = AudioPlayer();
  int score = 0;
  int flag = 0;
  bool gameOver = false;
  final controller = ConfettiController();
  AudioCache audioCache = AudioCache();

  void initGame() {
    gameOver = false;
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (score == 100) gameOver = true;
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        if (!gameOver)
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: 'https://img.freepik.com/free-vector/cartoon-empty-underground-car-parking-indoor-interior-garage-city-shopping-mall-basement-with-marking-road-automobile-park-places-columns-sign-exit-guiding-arrows-concrete-floor_88138-809.jpg?w=1060&t=st=1659092730~exp=1659093330~hmac=736ca94b249a853697fb1623b72a5f51598d67dd153e771e6b84df3d0eb5651d',
                    fit: BoxFit.fill,
                  ),
                ),
                slider(context),
                Align(
                  alignment: const AlignmentDirectional(0.90, 0.74),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: MediaQuery.of(context).size.width / 2.7,
                    //color: Colors.amber,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (vehicles[ansIndex].name == vehicles[index].name) {
                                    setState(() {
                                      player.play(AssetSource('correct.wav'));
                                      shuffleAndSetAnswer();
                                      score += 20;
                                    });
                                  } else {
                                    player.play(AssetSource('wrong.wav'));
                                  }
                                },
                                child: SizedBox(
                                    //color: Colors.black26,
                                    height: MediaQuery.of(context).size.height / 6.7,
                                    width: MediaQuery.of(context).size.width / 2.8,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/gui/vo.png',
                                        width: MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                                      Center(
                                        child: Text(vehicles[index].name, style: const TextStyle(fontFamily: 'Chicle', letterSpacing: 3, fontSize: 32, fontWeight: FontWeight.bold)),
                                      ),
                                    ])),
                              ),
                              const SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.95, -0.95),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/gui/back.png',
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 12,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.95, -0.90),
                  child: SizedBox(
                    //color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Center(
                      child: Text.rich(TextSpan(children: [TextSpan(text: 'Score :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 9)), TextSpan(text: '$score', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 7))])),
                    ),
                  ),
                )
              ],
            ),
          ),
        if (gameOver) backgroundImage(context),
      ],
    )));
  }

  Align slider(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.9, 0.5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width / 1.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: vehicles[ansIndex].name == 'Truck' || vehicles[ansIndex].name == 'Helicopter' || vehicles[ansIndex].name == 'Fire Truck' || vehicles[ansIndex].name == 'Bus' || vehicles[ansIndex].name == 'Ship' || vehicles[ansIndex].name == 'Bike'
              ? CachedNetworkImage(
                  fit: vehicles[ansIndex].name == 'Bike' ? BoxFit.contain : BoxFit.fill,
                  imageUrl: vehicles[ansIndex].image,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                  // CircularProgressIndicator(
                  //     value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Lottie.network(vehicles[ansIndex].image),
        ),
      ),
    );
  }

  SizedBox backgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: 'https://img.freepik.com/free-vector/flat-comic-style-wallpaper_23-2148819714.jpg?w=996&t=st=1658942709~exp=1658943309~hmac=3db7cb703308e66d4bcca63e63823214d36e3575b9464bf5f2e168e46a452eb9',
            //'https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?t=st=1658739695~exp=1658740295~hmac=edb7b47b3b46e3d6b49382738f7e700c96d6ef5814d67b230ecc0637b4e51fae&w=900',
            fit: BoxFit.fill,
          ),
        ),
        Stack(
          children: [
            scoreBox(context),
            homeButton(context),
            replayButton(),
            Align(
              alignment: const AlignmentDirectional(0.02, 0.37),
              child: SizedBox(
                width: 130,
                height: 40,
                //color: Colors.black12,
                child: Center(
                  child: Text('$score', style: TextStyle(fontFamily: 'Chicle', color: Colors.teal, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height / 13)),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Align scoreBox(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 1),
      child: SizedBox(
        //color: Colors.amber,
        height: MediaQuery.of(context).size.height / 1,
        width: MediaQuery.of(context).size.width / 1.5,
        child: Image.asset(
          'assets/gui/gameCompleted.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Align homeButton(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.1, 0.9),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, 'home');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/homu.png',
            height: 85,
            width: 65,
          ),
        ),
      ),
    );
  }

  Align replayButton() {
    return Align(
      alignment: const AlignmentDirectional(0.16, 0.9),
      child: GestureDetector(
        onTap: () {
          setState(() {
            replay();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/replayButton.png',
            height: 85,
            width: 65,
          ),
        ),
      ),
    );
  }
}
