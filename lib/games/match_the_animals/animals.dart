import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

import 'itemModel.dart';

class Animals extends StatefulWidget {
  static const routeName = 'animals';
  const Animals({Key key}) : super(key: key);

  @override
  State<Animals> createState() => _AnimalsState();
}

class _AnimalsState extends ResumableState<Animals> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  void initState() {
    super.initState();
    items.shuffle();
    audioCache.play(items[0].audio);
  }

  @override
  dispose() {
    super.dispose();
  }

  void onReady() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<ItemModel> items = [
    ItemModel(
        value: 'dog',
        name: 'Dog',
        audio: 'dog,.wav',
        image:
            'https://assets1.lottiefiles.com/private_files/lf30_h8chtt4u.json',
        music: 'dog_voice.wav'),
    ItemModel(
        value: 'lion',
        name: 'Lion',
        audio: 'lion,.wav',
        image: 'https://assets6.lottiefiles.com/packages/lf20_vmollwvl.json',
        music: 'lion.mp3'),
    ItemModel(
        value: 'owl',
        name: 'Owl',
        audio: 'owl,.wav',
        image: 'https://assets2.lottiefiles.com/packages/lf20_xGSFL9.json',
        music: 'owl.wav'),
    ItemModel(
        value: 'elephant',
        name: 'Elephant',
        audio: 'elephant,.wav',
        image:
            'https://i.pinimg.com/originals/a7/59/7f/a7597f0db79302ae9506f1d557dfd318.gif',
        music: 'elephant.wav'),
    ItemModel(
        value: 'monkey',
        name: 'Monkey',
        audio: 'monkey,.wav',
        image: 'https://assets10.lottiefiles.com/packages/lf20_gvxqafpw.json',
        music: 'monkey.mp3'),
    ItemModel(
        value: 'cow',
        name: 'Cow',
        audio: 'cow,.wav',
        image: 'https://terasaath.in/coww.gif',
        //'https://i.pinimg.com/originals/a2/01/4f/a2014f435ab140e724923d6d594ca935.gif',
        music: 'cow.mp3'),
    ItemModel(
        value: 'bee',
        name: 'Honey bee',
        audio: 'bee,.wav',
        image:
            'https://assets9.lottiefiles.com/private_files/lf30_ldieofjb.json',
        music: 'bee.mp3'),
    ItemModel(
        value: 'penguin',
        name: 'Penguin',
        audio: 'penguin,.wav',
        image:
            'https://i.pinimg.com/originals/66/8c/3b/668c3bd964c155eeec4a911e50fb59f7.gif',
        //'https://assets5.lottiefiles.com/packages/lf20_44y9y3ky.json',
        //'https://assets8.lottiefiles.com/packages/lf20_44y9y3ky.json',
        music: 'penguin.mp3'), //desktop file
    ItemModel(
        value: 'butterfly',
        name: 'Butterfly',
        audio: 'butterfly,.wav',
        image:
            'https://assets10.lottiefiles.com/private_files/lf30_ce3fctyu.json',
        music: 'butterfly.mp3'),
    ItemModel(
        value: 'caterpillar',
        name: 'Caterpillar',
        audio: 'caterpillar,.wav',
        image: 'https://assets6.lottiefiles.com/packages/lf20_opjebefq.json',
        music: ''),
    // ItemModel(
    //     value: 'turtle',
    //     name: 'Turtle',
    //     image:
    //         'https://assets10.lottiefiles.com/private_files/lf30_51d8pwk4.json',
    //     music: 'panda.wav'),
    // ItemModel(
    //     value: 'croc',
    //     name: 'Crocodile',
    //     image: 'https://assets9.lottiefiles.com/packages/lf20_f54ylzjs.json',
    //     music: 'owl.wav'),
    ItemModel(
        value: 'duck',
        name: 'Duck',
        audio: 'duck,.wav',
        image:
            'https://assets2.lottiefiles.com/private_files/lf30_oiaetlzu.json',
        music: 'duck.mp3'),
    ItemModel(
        value: 'cat',
        name: 'Cat',
        audio: 'cat,.wav',
        //https://assets1.lottiefiles.com/private_files/lf30_b91uuvwz.json
        image:
            'https://assets10.lottiefiles.com/private_files/lf30_axnm9fti.json',
        music: 'cat.mp3'),
    // ItemModel(
    //     value: 'kangaroo',
    //     name: 'Kangaroo',
    //     image: 'https://assets8.lottiefiles.com/packages/lf20_odsaqoyl.json',
    //     music: 'owl.wav'),
  ];
  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CachedNetworkImage(
                  imageUrl:'https://img.freepik.com/free-vector/organic-flat-jungle-background_23-2148952811.jpg?w=996&t=st=1658824128~exp=1658824728~hmac=c65dbac5c9839e812060d8154ca4eb6e3d2745082595ee999554873575c76a5a',
                  //'assets/animalBack.png',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.95, -0.95),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                    //.pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
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
              ),
              Align(
                alignment: AlignmentDirectional(-0.12, 1),
                child: Container(
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
                            audioCache.play(items[index].audio);
                          },
                          autoPlayCurve: Curves.fastOutSlowIn),
                      itemCount: items.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 1.6,
                              width: MediaQuery.of(context).size.width / 2,
                              child: GestureDetector(
                                child: ClipRRect(
                                  child: items[index].name == 'Cow' ||
                                          items[index].name == 'Elephant' ||
                                          items[index].name == 'Penguin'
                                      ? CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: items[index].image,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SpinKitDualRing(
                                                  color: Colors.amberAccent),
                                          // CircularProgressIndicator(
                                          //     value: downloadProgress.progress),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.error,
                                            size: 35,
                                          ),
                                        )
                                      : Lottie.network(items[index].image,
                                          fit: items[index].name == 'Cat'
                                              ? BoxFit.contain
                                              : BoxFit.contain),
                                ),
                                onTap: () {
                                  audioCache.play(items[index].music);
                                },
                              ),
                              decoration: BoxDecoration(
                                //color: Color(0xFFFFFFF0),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 35,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 7.5,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    items[index].name,
                                    style: TextStyle(
                                      fontFamily: 'party',
                                      letterSpacing: 2,
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              10.5,
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
              ),
              Align(
                alignment: AlignmentDirectional(-0.95, 0.2),
                child: InkWell(
                  onTap: () {
                    caro.previousPage();
                  },
                  child: Image.asset(
                    'assets/gui/left.png',
                    height: MediaQuery.of(context).size.height / 5.2,
                    width: MediaQuery.of(context).size.width / 9.6,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.95, 0.2),
                child: InkWell(
                  onTap: () {
                    caro.nextPage();
                  },
                  child: Image.asset(
                    'assets/gui/right.png',
                    height: MediaQuery.of(context).size.height / 5.2,
                    width: MediaQuery.of(context).size.width / 9.6,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.95, -1.05),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
