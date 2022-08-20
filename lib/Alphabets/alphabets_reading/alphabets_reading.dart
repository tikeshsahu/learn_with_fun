import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';
import 'class.dart';

class AlphabetsLearning extends StatefulWidget {
  static const routeName = 'alphaReading';
  const AlphabetsLearning({Key key}) : super(key: key);

  @override
  State<AlphabetsLearning> createState() => _AlphabetsLearningState();
}

class _AlphabetsLearningState extends ResumableState<AlphabetsLearning> {
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    audioCache.play("AA.mp3");
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
  }

  AudioCache audioCache = AudioCache();
  bool loading;
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  List<AlphabetsReadingModel> alphabets = [
    AlphabetsReadingModel(
        title: 'A',
        description: 'A  for  Apple',
        image: "assets/Alphabets/image/A.png",
        forImage:
            "https://assets5.lottiefiles.com/private_files/lf30_03o4rzc9.json",
        pronounciation: "AA.mp3",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'B',
        description: 'B  for  Boy',
        image: "assets/Alphabets/image/B.png",
        forImage: "https://assets8.lottiefiles.com/packages/lf20_x9puwsf6.json",
        pronounciation: "BA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'C',
        description: 'C  for  Car',
        image: "assets/Alphabets/image/C.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_8NYY2Y.json",
        pronounciation: "CA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'D',
        description: 'D  for  Dog',
        image: "assets/Alphabets/image/D.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_PXcBlV.json",
        pronounciation: "DA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'E',
        description: 'E  for  Elephant',
        image: "assets/Alphabets/image/E.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_xgwzkywz.json",
        pronounciation: "EA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'F',
        description: 'F  for  Fish',
        image: "assets/Alphabets/image/F.png",
        forImage: "https://assets6.lottiefiles.com/packages/lf20_t6zvi4la.json",
        pronounciation: "FA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'G',
        description: 'G  for  Grapes',
        image: "assets/Alphabets/image/G.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_ayb8hcrh.json",
        pronounciation: "GA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'H',
        description: 'H  for  Hen',
        image: "assets/Alphabets/image/H.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_nalpzjl6.json",
        pronounciation: "HA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'I',
        description: 'I  for  IceCream',
        image: "assets/Alphabets/image/I.png",
        forImage: "https://assets8.lottiefiles.com/packages/lf20_glqkl1qa.json",
        pronounciation: "IA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'J',
        description: 'J  for  Joker',
        image: "assets/Alphabets/image/J.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_txyga2ag.json",
        pronounciation: "JA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'K',
        description: 'K  for  Kite',
        image: "assets/Alphabets/image/K.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_6ef4hgzm.json",
        pronounciation: "KA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'L',
        description: 'L  for  Lion',
        image: "assets/Alphabets/image/L.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_vmollwvl.json",
        pronounciation: "LA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'M',
        description: 'M  for  Monkey',
        image: "assets/Alphabets/image/M.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_q7uarxsb.json",
        pronounciation: "MA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'N',
        description: 'N  for  Notebook',
        image: "assets/Alphabets/image/N.png",
        forImage:
            "https://assets10.lottiefiles.com/private_files/lf30_cldvedro.json",
        pronounciation: "NA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'O',
        description: 'O  for  Owl',
        image: "assets/Alphabets/image/O.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_xGSFL9.json",
        pronounciation: "OA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'P',
        description: 'P  for  Pencil',
        image: "assets/Alphabets/image/P.png",
        forImage: "https://assets3.lottiefiles.com/packages/lf20_z7dwyelr.json",
        pronounciation: "PA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Q',
        description: 'Q  for  Queen',
        image: "assets/Alphabets/image/Q.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_zergdtgj.json",
        pronounciation: "QA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'R',
        description: 'R  for  Rabbit',
        image: "assets/Alphabets/image/R.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_3iiqbu3x.json",
        pronounciation: "RA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'S',
        description: 'S  for  Sun',
        image: "assets/Alphabets/image/S.png",
        forImage:
            "https://assets6.lottiefiles.com/private_files/lf30_6gqfjgqh.json",
        pronounciation: "SA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'T',
        description: 'T  for  Tomato',
        image: "assets/Alphabets/image/T.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_zkhpkpyc.json",
        pronounciation: "TA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'U',
        description: 'U  for  Umbrella',
        image: "assets/Alphabets/image/U.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_DyDkQs.json",
        pronounciation: "UA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'V',
        description: 'V  for  Van',
        image: "assets/Alphabets/image/V.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_8SfnRn.json",
        pronounciation: "VA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'W',
        description: 'W  for  Watermelon',
        image: "assets/Alphabets/image/W.png",
        forImage:
            "https://assets3.lottiefiles.com/datafiles/0cjunjXZVrOzIAb/data.json",
        pronounciation: "WA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'X',
        description: 'X  for  Xylophone',
        image: "assets/Alphabets/image/X.png",
        forImage: "https://assets5.lottiefiles.com/packages/lf20_yeh2DQ.json",
        pronounciation: "XA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Y',
        description: 'Y  for  Yoga',
        image: "assets/Alphabets/image/Y.png",
        forImage:
            "https://assets7.lottiefiles.com/packages/lf20_01kulrrn/yoga.json",
        pronounciation: "YA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Z',
        description: 'Z  for  Zebra',
        image: "assets/Alphabets/image/Z.png",
        forImage:
            'https://media.baamboozle.com/uploads/images/51668/1644508771_88855_gif-url.gif',
        //"https://assets9.lottiefiles.com/packages/lf20_5tg9fwbp.json",
        pronounciation: "ZA.wav",
        itemIsPressed: false),
  ];

  CarouselController caro = CarouselController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
              child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Image.network(
            //'https://img.freepik.com/free-vector/blue-back-school-frame_53876-118446.jpg?w=996&t=st=1659527559~exp=1659528159~hmac=2f333d46b8ab3b28060d2d5b8341c565eec87ea92255c0d93521e537c7b298d1',
            'https://png.pngtree.com/thumb_back/fw800/back_pic/03/87/56/9757d25d61d31ad.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.00),
            child: Image.asset(
              'assets/Alphabets/bb.png',
              height: MediaQuery.of(context).size.height / 1.01,
              width: MediaQuery.of(context).size.width / 1.15,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.95, -0.95),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/gui/homu.png',
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 10,
              ),
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
            alignment: AlignmentDirectional(0.00, -0.24),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.45,
              //color: Colors.black38,
              child: CarouselSlider.builder(
                  carouselController: caro,
                  options: CarouselOptions(
                      height: 270,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.90,
                      onPageChanged: (index, reason) {
                        audioCache.play(alphabets[index].pronounciation);
                      },
                      autoPlayCurve: Curves.fastOutSlowIn),
                  itemCount: alphabets.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 140,
                          //color: Colors.amber,
                          child: GestureDetector(
                            child: Image.asset(
                              alphabets[index].image,
                              fit: alphabets[index].title == 'W' ||
                                      alphabets[index].description == 'I'
                                  ? BoxFit.contain
                                  : BoxFit.cover,
                            ),
                            onTap: () {
                              // setState(() {
                              //   alphabets[index].itemIsPressed =
                              //       !alphabets[index].itemIsPressed;
                              // });
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 28,
                        ),
                        Text(
                          'For',
                          style: TextStyle(
                              fontFamily: 'Chicle',
                              fontSize: 35,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 24,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: alphabets[index].description == 'Z  for  Zebra'
                              ? Image.network(
                                  alphabets[index].forImage,
                                  fit: BoxFit.fill,
                                )
                              : Lottie.network(
                                  alphabets[index].forImage,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, url, error) => Icon(
                                    Icons.error,
                                    size: 30,
                                  ),
                                ),
                          decoration: BoxDecoration(
                            //color: Color(0xFFFFFFF0),
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          )
        ]),
      ))),
    );
  }
}
