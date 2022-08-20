import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends ResumableState<Home> {
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

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  List<Game> games = [
    Game(
        Name: 'Animals',
        Path: 'animals',
        Image:
            'https://img.freepik.com/free-vector/many-cute-animals-bamboo-forest_1308-32851.jpg?w=996'),
    Game(
        Name: 'Fruits',
        Path: 'fruits',
        Image:
            'https://img.freepik.com/free-vector/various-superhero-fruits-flat-icon-set_74855-7924.jpg?t=st=1657703099~exp=1657703699~hmac=dd2ab310c9101d5446f64bcc7e1cb1659303cf7637ef1d2c28faf19663776786&w=1060'),
    Game(
        Name: 'Alphabets',
        Path: 'alphaReading',
        Image:
            'https://img.freepik.com/free-vector/set-cartoon-funny-difference-english-alphabets-kindergarteners-preschool_1150-49039.jpg?t=st=1657705156~exp=1657705756~hmac=a862d64b9137c802b3999e17276c8b18b20a8288acf5d2889525a5697a04df60&w=740'),
    Game(
        Name: 'Numbers',
        Path: 'numbersreading',
        Image:
            //'https://i.scdn.co/image/ab67706c0000bebb6134dcd1fa248a9c522f2e29'),
            'https://img.freepik.com/free-vector/number-one-two-three-with-dinosaur-cartoon_1308-99066.jpg?t=st=1657702528~exp=1657703128~hmac=fa7f2f5b70ab39bc6f1c78058e682df84a5ea5ae1dd654ff936298ba04016dea&w=826'),
    Game(
        Name: 'Vehicles',
        Path: 'vehicles',
        Image:
            'https://img.freepik.com/free-vector/set-kids-riding-gokart_1308-107869.jpg?t=st=1657706364~exp=1657706964~hmac=9c654e12b4e38fef3395cf5e2ae289fe496794c5946efbe1cdf818286f949df3&w=1060'),
    Game(
        Name: 'Professions',
        Path: 'professions',
        Image:
            'https://img.freepik.com/free-vector/flat-cartoon-composition-with-group-children-wearing-costumes-professionals_1284-15240.jpg'),
    //'https://img.freepik.com/premium-vector/design-collection-characters-from-various-professions_454510-14.jpg?w=1060'),
    // Game(
    //     Name: 'Missing  One',
    //     Path: 'missingGame',
    //     Image:
    //         'https://img.freepik.com/premium-vector/write-down-missing-numbers-animal-drivers-cartoon-cartoon-cars-with-numbers-from-1-9_456865-758.jpg?w=900'),
    //
    Game(
        Name: 'Lets  Count',
        Path: 'countingGame',
        Image:
            'https://img.freepik.com/free-vector/counting-numbers-with-kids-balloons_1308-71435.jpg?t=st=1657701365~exp=1657701965~hmac=02644cae2927636ac142eb0f9ba6dbb36b2eb3c7efc208225be65b0d8aaa08ff&w=900'),
    Game(
        Name: 'Identify',
        Path: 'identify',
        Image:
            'https://img.freepik.com/free-vector/many-wild-animals-forest_1308-35642.jpg?t=st=1657809827~exp=1657810427~hmac=2ea6d61357856be58f5f66222017085c07b38432fb41a777443761d159d79dff&w=1380'),
    Game(
        Name: 'Colours',
        Path: 'colors',
        Image:
            'https://img.freepik.com/free-vector/happy-cute-little-kid-boy-paint-canvas_97632-2126.jpg?t=st=1658634368~exp=1658634968~hmac=a74ff9bc14dcf419d9e0b81b67dc8bfed3447d4b8b0fd59f56d845afa2fab41e&w=900'),
    // Game(
    //     Name: "Let's  Write",
    //     Path: 'alphaWriting',
    //     Image:
    //         'https://img.freepik.com/premium-vector/happy-cute-little-kid-boy-girl-with-book-letter_97632-1938.jpg?w=826'),
    // Game(
    //     Name: 'Trail',
    //     Image:
    //         'https://images.unsplash.com/photo-1657722297183-d2c39354e25a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     Path: 'trail'),
    Game(
        Name: 'Puzzles',
        Path: 'puzzle',
        Image:
            'https://img.freepik.com/premium-vector/happy-cute-little-kid-boy-girl-play-jigsaw-puzzle_97632-2431.jpg?w=996'),
    //   Game(
    //       Name: 'Math  Fun',
    //       Path: 'addition',
    //       Image:
    //           'https://img.freepik.com/free-vector/poster-design-with-numbers-signs_1308-14343.jpg?t=st=1657777627~exp=1657778227~hmac=95af72baee9b5c90c06b8eea11d998b7a54d187a497c783a6505b3fad118346e&w=740')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl:
                    //'https://i.pinimg.com/originals/c4/b5/07/c4b5076a2a215e0b6d341a3f399ccf99.jpg',
                    'https://img.freepik.com/free-vector/color-seamless-space-pattern_102902-2360.jpg?t=st=1658496795~exp=1658497395~hmac=575a76b85673b0c448f5332643faa5b7904b99835c4d0683e09bce54db8d8f4f&w=996',
                fit: BoxFit.fill,
              )),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 8.5,
                width: MediaQuery.of(context).size.width,
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 18),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.cyan,
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                            options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: true,
                                viewportFraction: 0.6,
                                autoPlayCurve: Curves.fastOutSlowIn),
                            itemCount: games.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              return GestureDetector(
                                onTap: () {
                                  if (games[itemIndex].Name == 'Animals' ||
                                      games[itemIndex].Name == 'Fruits' ||
                                      games[itemIndex].Name == 'Alphabets' ||
                                      games[itemIndex].Name == 'Numbers' ||
                                      games[itemIndex].Name == 'Vehicles' ||
                                      games[itemIndex].Name == 'Professions') {
                                    pushNamed(context, games[itemIndex].Path);
                                  } else
                                    () {};
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                28.0),
                                            child:
                                                games[itemIndex].Name ==
                                                            'Animals' ||
                                                        games[itemIndex].Name ==
                                                            'Fruits' ||
                                                        games[itemIndex].Name ==
                                                            'Alphabets' ||
                                                        games[itemIndex].Name ==
                                                            'Numbers' ||
                                                        games[itemIndex].Name ==
                                                            'Vehicles' ||
                                                        games[itemIndex].Name ==
                                                            'Professions'
                                                    ? Container(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              games[itemIndex]
                                                                  .Image,
                                                          height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .height,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                    : Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                            games[itemIndex]
                                                                .Image,
                                                          )),
                                                        ),
                                                        child: BackdropFilter(
                                                          filter:
                                                              ImageFilter.blur(
                                                                  sigmaX: 2,
                                                                  sigmaY: 2),
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.01),
                                                              child: Lottie.network(
                                                                  'https://assets2.lottiefiles.com/packages/lf20_ur3u8zt5.json')),
                                                        ),
                                                      ))
                                        //),
                                        ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7.5,
                                      width: MediaQuery.of(context).size.width,
                                      //color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          games[itemIndex].Name,
                                          style: TextStyle(
                                            fontFamily: 'chock',
                                            fontSize: 40,
                                            color: Color.fromARGB(
                                                255, 244, 251, 23),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ],
                    )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class Game {
  final String Name;
  final String Image;
  final String Path;

  Game({this.Name, this.Image, this.Path});
}
