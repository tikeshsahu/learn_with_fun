import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';
import '../match_the_animals/itemModel.dart';

class Fruits extends StatefulWidget {
  static const routeName = 'fruits';
  const Fruits({Key key}) : super(key: key);

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends ResumableState<Fruits> {

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
    // Implement your code inside here
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
    // audioPlayer.resume();
  }

  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();
  List<ItemModel> items = [
    ItemModel(
      value: 'banana',
      name: 'Banana',
      audio: 'banana.wav',
      image: 'https://assets8.lottiefiles.com/packages/lf20_kyusfkfp.json',
    ),
    ItemModel(
      value: 'straw',
      name: 'Strawberry',
      audio: 'strawberry.wav',
      image:
          'https://media0.giphy.com/media/ic9JCSTgNQUn9g5aWd/giphy.gif?cid=790b7611fb25568bbfd102033b0b595392d858f2e02c135b&rid=giphy.gif&ct=s',
    ),
    ItemModel(
      value: 'orange',
      name: 'Orange',
      audio: 'orange.wav',
      image:
          'https://media1.giphy.com/media/l1rJI1U9iYFgI1AE0f/giphy.gif?cid=790b76111674606eee7a4e34632e6b519d961fd318937c7b&rid=giphy.gif&ct=s',
      //'https://assets9.lottiefiles.com/packages/lf20_pfsppq45.json',
    ),
    ItemModel(
      value: 'pear',
      name: 'Pears',
      audio: 'pears.wav',
      image: 'https://assets9.lottiefiles.com/packages/lf20_opljg7yp.json',
    ),
    ItemModel(
      value: 'pineapple',
      name: 'Pineapple',
      audio: 'pineapple.wav',
      image:
          'https://thumbs.gfycat.com/SpryBlueApisdorsatalaboriosa-size_restricted.gif',
      //'https://assets8.lottiefiles.com/packages/lf20_etiq0fbs.json',
    ),
    ItemModel(
      value: 'mango',
      name: 'Mango',
      audio: 'mango.wav',
      image: 'https://assets8.lottiefiles.com/packages/lf20_sas45b58.json',
    ),
    ItemModel(
        value: 'Watermelon',
        name: 'Watermelon',
        audio: 'watermelon.wav',
        image:
            'https://thumbs.gfycat.com/HilariousContentAnole-size_restricted.gif'
        //'https://assets8.lottiefiles.com/packages/lf20_n2nxpuho.json',
        ),
    ItemModel(
      value: 'grapes',
      name: 'Grapes',
      audio: 'grapes.wav',
      image:
          'https://media.baamboozle.com/uploads/images/117411/1619424207_176960_url.gif',
    ),
    ItemModel(
      value: 'carrot',
      name: 'Carrot',
      audio: 'carrot.wav',
      image: 'https://assets7.lottiefiles.com/packages/lf20_y3pev23v.json',
    ),
    ItemModel(
      value: 'tomato',
      name: 'Tomato',
      audio: 'tomato.wav',
      image: 'https://assets8.lottiefiles.com/packages/lf20_zkhpkpyc.json',
    ),
    ItemModel(
      value: 'apple',
      name: 'Apple',
      audio: 'applee.wav',
      image:
          'https://i.pinimg.com/originals/9f/b0/09/9fb009311f5490d552840b4a0a5e30bb.gif',
    ),
    ItemModel(
      value: 'cherry',
      name: 'Cherry',
      audio: 'cherry.wav',
      image:
          'https://i.pinimg.com/originals/61/f5/c0/61f5c0ced6ce466ad08b9151c263c686.gif',
    ),
  ];

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
                child: Image.network(
                  //'https://img.freepik.com/free-vector/organic-flat-jungle-background_23-2148952811.jpg?w=996&t=st=1658824128~exp=1658824728~hmac=c65dbac5c9839e812060d8154ca4eb6e3d2745082595ee999554873575c76a5a',
                  //'assets/animalBack.png',
                  'https://img.freepik.com/free-vector/orange-patterned-frame_53876-93816.jpg?w=996&t=st=1658840542~exp=1658841142~hmac=b6f676f59b865293a8ed18827ae0e7f854471a3a1d234ebebf561f7fdb076227',
                  fit: BoxFit.fill,
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
                      'assets/gui/homu.png',
                      height: MediaQuery.of(context).size.height / 5.5,
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.80),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.49,
                  height: MediaQuery.of(context).size.height / 1.395,
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
                              height: MediaQuery.of(context).size.height / 2.02,
                              width: MediaQuery.of(context).size.width / 2,
                              //color: Color(0xFFFFFFF0),
                              child: GestureDetector(
                                child: ClipRRect(
                                  child: items[index].name == 'Apple' ||
                                          items[index].name == 'Grapes' ||
                                          items[index].name == 'Strawberry' ||
                                          items[index].name == 'Cherry' ||
                                          items[index].name == 'Pineapple' ||
                                          items[index].name == 'Watermelon' ||
                                          items[index].name == 'Orange'
                                      ? CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: items[index].image,
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                                  SpinKitDualRing(
                                                      color: Colors.amberAccent),
                                          // CircularProgressIndicator(
                                          //     value: downloadProgress.progress),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )
                                      : Lottie.network(items[index].image,
                                          fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                                      fontSize: MediaQuery.of(context).size.height /
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
                alignment: AlignmentDirectional(-0.95, 0),
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
                alignment: AlignmentDirectional(0.95, 0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
