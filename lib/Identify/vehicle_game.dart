import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';
import 'dart:math';

class VehicleGame extends StatefulWidget {
  static const routeName = 'vehicleGame';
  const VehicleGame({Key key}) : super(key: key);

  @override
  State<VehicleGame> createState() => _VehicleGameState();
}

class _VehicleGameState extends ResumableState<VehicleGame> {
  void initState() {
    super.initState();
    initGame();
    shuffleAndSetAnswer();
  }

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

  @override
  dispose() {
    super.dispose();
  }

  int ansIndex;

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

  List<gaddi> vehicles = [
    gaddi(
      name: 'Ambulance',
      image: 'https://assets7.lottiefiles.com/packages/lf20_sy2feyup.json',
      //'https://img.freepik.com/free-vector/emergency-ambulance-concept_23-2148537138.jpg?t=st=1657693318~exp=1657693918~hmac=8bfff4f0c276fa8d47ae222144228fa5f6115ee4d61eff6ab9e7f3fb598c13d0&w=996',
    ),
    gaddi(name: 'Bus', image: 'https://terasaath.in/proBus.png'
        //'https://img.freepik.com/premium-vector/happy-cute-kids-wait-school-bus-with-friends_97632-1086.jpg?w=1060',
        ),
    gaddi(
        name: 'Car',
        image: 'https://assets2.lottiefiles.com/packages/lf20_swnrn2oy.json'
        //'https://img.freepik.com/premium-vector/automotive-car-vehicle-illustration-vector-design-graphic_617770-58.jpg?w=900',
        ),
    gaddi(
      name: 'Bike',
      image: 'https://terasaath.in/vehBike.png',
    ),
    gaddi(
      name: 'Aeroplane',
      image: 'https://assets7.lottiefiles.com/packages/lf20_fyffhdtn.json',
      //'https://img.freepik.com/free-vector/airplane-takeoff-poster_1284-9440.jpg?t=st=1657693402~exp=1657694002~hmac=86a0ff3d543411d5c6ec8bd0cd81a6b97b34e2c988440424f0dff57b7698b5be&w=996',
    ),
    gaddi(
      name: 'Ship',
      image: 'https://i.ibb.co/Q97yVRx/giphy.gif',
      //'https://assets7.lottiefiles.com/packages/lf20_0fytsweq.json',
      //'https://img.freepik.com/premium-vector/cruise-big-ship_177886-392.jpg?w=1380',
    ),
    gaddi(
        name: 'Bicycle',
        image: 'https://assets3.lottiefiles.com/packages/lf20_ht8zw3es.json'
        //'https://img.freepik.com/premium-vector/happy-cute-little-kid-boy-riding-bicycle_97632-3707.jpg?w=740',
        ),
    gaddi(
      name: 'Helicopter',
      image:
          'https://img.freepik.com/premium-vector/helicopter-flat-style-vector-illustration_6427-225.jpg?w=996',
    ),
    gaddi(
      name: 'Fire Truck',
      image: 'https://terasaath.in/vehFire.png',
    ),
    gaddi(
      name: 'Scooter',
      image: 'https://assets4.lottiefiles.com/packages/lf20_gxhmijxe.json',
      //'https://img.freepik.com/free-vector/man-riding-scooter-white-background_1308-46333.jpg?t=st=1657694175~exp=1657694775~hmac=de4e876a46d3fecece33cb25fdc7e053edc927030d85b469b7d79100133982fa&w=740',
    ),
    gaddi(
        name: 'Tractor',
        image: 'https://assets2.lottiefiles.com/packages/lf20_qnA9I4.json'
        //'https://img.freepik.com/premium-vector/farm-tractor-vehicle_18591-41184.jpg?w=740',
        ),
    gaddi(
      name: 'Truck',
      image: 'https://terasaath.in/vehTruck.png',
      //'https://img.freepik.com/free-vector/hand-drawn-illustrated-transport-truck_23-2149145942.jpg?t=st=1657694348~exp=1657694948~hmac=70683d1cdad294653db07a528f1c8d9ef5e60a12c5295723706159af4772d089&w=1060',
    ),
  ];

  int score, flag = 0;
  bool gameOver = false;
  final controller = ConfettiController();
  AudioCache audioCache = AudioCache();

  @override
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://img.freepik.com/free-vector/cartoon-empty-underground-car-parking-indoor-interior-garage-city-shopping-mall-basement-with-marking-road-automobile-park-places-columns-sign-exit-guiding-arrows-concrete-floor_88138-809.jpg?w=1060&t=st=1659092730~exp=1659093330~hmac=736ca94b249a853697fb1623b72a5f51598d67dd153e771e6b84df3d0eb5651d',
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.9, 0.5),
                  child: Container(
                    //color: Colors.white24,
                    // padding: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 1.4,
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: vehicles[ansIndex].name == 'Truck' ||
                              vehicles[ansIndex].name == 'Helicopter' ||
                              vehicles[ansIndex].name == 'Fire Truck' ||
                              vehicles[ansIndex].name == 'Bus' ||
                              vehicles[ansIndex].name == 'Ship' ||
                              vehicles[ansIndex].name == 'Bike'
                          ? CachedNetworkImage(
                              fit: vehicles[ansIndex].name == 'Bike'
                                  ? BoxFit.contain
                                  : BoxFit.fill,
                              imageUrl: vehicles[ansIndex].image,
                              progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                  SpinKitDualRing(color: Colors.amberAccent),
                              // CircularProgressIndicator(
                              //     value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Lottie.network(vehicles[ansIndex].image),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.90, 0.74),
                  child: Container(
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
                                  if (vehicles[ansIndex].name ==
                                      vehicles[index].name) {
                                    setState(() {
                                      audioCache.play('correct.wav');
                                      shuffleAndSetAnswer();
                                      score += 20;
                                    });
                                  } else {
                                    audioCache.play('wrong.wav');
                                  }
                                },
                                child: Container(
                                    //color: Colors.black26,
                                    height: MediaQuery.of(context).size.height /
                                        6.7,
                                    width:
                                        MediaQuery.of(context).size.width / 2.8,
                                    child: Stack(children: [
                                      Image.asset(
                                        'assets/gui/vo.png',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                                      Center(
                                        child: Text(vehicles[index].name,
                                            style: TextStyle(
                                                fontFamily: 'Chicle',
                                                letterSpacing: 3,
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ])),
                              ),
                              SizedBox(
                                height: 12,
                              )
                            ],
                          );
                        }),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.95, -0.95),
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
                  alignment: AlignmentDirectional(-0.95, -0.90),
                  child: Container(
                    //color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Center(
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Score :  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 9)),
                        TextSpan(
                            text: '$score',
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 7))
                      ])),
                    ),
                  ),
                )
              ],
            ),
          ),
        if (gameOver)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  'https://img.freepik.com/free-vector/flat-comic-style-wallpaper_23-2148819714.jpg?w=996&t=st=1658942709~exp=1658943309~hmac=3db7cb703308e66d4bcca63e63823214d36e3575b9464bf5f2e168e46a452eb9',
                  //'https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?t=st=1658739695~exp=1658740295~hmac=edb7b47b3b46e3d6b49382738f7e700c96d6ef5814d67b230ecc0637b4e51fae&w=900',
                  fit: BoxFit.fill,
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Container(
                      //color: Colors.amber,
                      height: MediaQuery.of(context).size.height / 1,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Image.asset(
                        'assets/gui/gameCompleted.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.1, 0.9),
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
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.16, 0.9),
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
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.02, 0.37),
                    child: Container(
                      width: 130,
                      height: 40,
                      //color: Colors.black12,
                      child: Center(
                        child: Text('$score',
                            style: TextStyle(
                                fontFamily: 'Chicle',
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 13)),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
      ],
    )));
  }
}

class gaddi {
  final String name;
  final String image;
  final int value;
  gaddi({this.name, this.image, this.value});
}