import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_game/match_the_animals/itemModel.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class FruitsMatchGame extends StatefulWidget {
  static const routeName = 'matchFruits';
  const FruitsMatchGame({Key key}) : super(key: key);

  @override
  State<FruitsMatchGame> createState() => _FruitsMatchGameState();
}

class _FruitsMatchGameState extends ResumableState<FruitsMatchGame> {
  void initState() {
    super.initState();
    initGame();
  }

  void onReady() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  AudioCache audioCache = AudioCache();
  List<ItemModel> items2, newlistitems = [];
  List<ItemModel> items = [
    ItemModel(
      value: 'banana',
      name: 'Banana',
      image: 'https://assets8.lottiefiles.com/packages/lf20_kyusfkfp.json',
    ),
    ItemModel(
      value: 'orange',
      name: 'Orange',
      image: 'https://assets9.lottiefiles.com/packages/lf20_pfsppq45.json',
    ),
    ItemModel(
      value: 'pears',
      name: 'Pears',
      image: 'https://assets9.lottiefiles.com/packages/lf20_opljg7yp.json',
    ),
    ItemModel(
      value: 'pineapple',
      name: 'Pineapple',
      image: 'https://assets8.lottiefiles.com/packages/lf20_etiq0fbs.json',
    ),
    ItemModel(
      value: 'mango',
      name: 'Mango',
      image: 'https://assets8.lottiefiles.com/packages/lf20_sas45b58.json',
    ),
    ItemModel(
      value: 'Watermelon',
      name: 'Watermelon',
      image: 'https://assets8.lottiefiles.com/packages/lf20_n2nxpuho.json',
    ),
    ItemModel(
      value: 'grapes',
      name: 'Grapes',
      image:
          'https://media.baamboozle.com/uploads/images/117411/1619424207_176960_url.gif',
    ),
    ItemModel(
      value: 'carrot',
      name: 'Carrot',
      image: 'https://assets7.lottiefiles.com/packages/lf20_y3pev23v.json',
    ),
  ];
  int score, flag = 0;
  bool gameOver;

  @override
  void initGame() {
    gameOver = false;
    score = 0;
    flag = 0;
    items.shuffle();

    for (var item in items) {
      ++flag;
      newlistitems.add(item);
      if (flag == 5) {
        break;
      }
    }
    items2 = List<ItemModel>.from(newlistitems);
    items2.shuffle();
  }

  replay() {
    setState(() {
      initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (score == 100) gameOver = true;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(children: [
          Column(
            children: [
              if (!gameOver)
                Column(
                  children: [
                    Container(
                      //color: Colors.amber,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10.3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeRight,
                                DeviceOrientation.landscapeLeft,
                              ]);
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              'assets/gui/back.png',
                              height: 50,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 6.5,
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Score :  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            17)),
                            TextSpan(
                                text: '$score',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            15))
                          ])),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(flex: 2),
                        Column(
                          children: newlistitems.map((item) {
                            return Container(
                              // color: Colors.amber,
                              margin: EdgeInsets.all(6),
                              child: Draggable<ItemModel>(
                                data: item,
                                childWhenDragging: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: item.name == 'Grapes'
                                      ? Image.network(
                                          item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(
                                          item.image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                feedback: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6.6,
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  child: item.name == 'Grapes'
                                      ? Image.network(
                                          item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(item.image,
                                          fit: BoxFit.cover),
                                ),
                                child: Container(
                                  //color: Colors.amberAccent,
                                  height:
                                      MediaQuery.of(context).size.height / 6.5,
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  child: item.name == 'Grapes'
                                      ? Image.network(
                                          item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(item.image,
                                          fit: item.name == 'Cat'
                                              ? BoxFit.fill
                                              : BoxFit.fill),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Spacer(
                          flex: 3,
                        ),
                        Container(
                          //color: Colors.amber,
                          child: Column(
                            children: items2.map((item) {
                              return DragTarget<ItemModel>(
                                  onAccept: (receivedItem) {
                                    if (item.value == receivedItem.value) {
                                      audioCache.play('correct.wav');
                                      //audioCache.play(item.music);
                                      setState(() {
                                        newlistitems.remove(receivedItem);
                                        items2.remove(item);
                                      });
                                      score += 20;
                                      item.accepting = false;
                                    } else {
                                      audioCache.play('wrong.wav');
                                      setState(() {
                                        item.accepting = false;
                                      });
                                    }
                                  },
                                  onWillAccept: (receivedItem) {
                                    setState(() {
                                      item.accepting = true;
                                    });
                                    return true;
                                  },
                                  onLeave: (receivedItem) {
                                    setState(() {
                                      item.accepting = false;
                                    });
                                  },
                                  builder: (context, acceptedItems,
                                          rejectedItems) =>
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: item.accepting
                                                ? Color.fromARGB(
                                                    255, 199, 197, 197)
                                                : Color.fromARGB(
                                                    255, 226, 223, 223)),
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8.8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        margin: EdgeInsets.all(24),
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ));
                            }).toList(),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              if (gameOver)
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
                                //'https://img.freepik.com/free-vector/fruits-background-desktop-wallpaper-cute-vector_53876-140209.jpg?w=996&t=st=1659075891~exp=1659076491~hmac=1b863be5ab5be31848f3e071337310c648c5bc9fa6fa5814b446d3965180fe86',
                                'https://img.freepik.com/premium-vector/abstract-comic-rays-background-vector_1035-14508.jpg?w=740',
                            //'https://img.freepik.com/premium-vector/little-animals-forest_43633-4000.jpg?w=360',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.2),
                          child: Container(
                            //color: Colors.black12,
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: Image.asset(
                              'assets/gui/gameCompleted2.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.95, -0.99),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'home');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/gui/homu.png',
                                height: 80,
                                width: 60,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.04, 0.33),
                          child: Container(
                            width: 126,
                            height: 38,
                            //color: Colors.black26,
                            child: Center(
                              child: Text('$score',
                                  style: TextStyle(
                                      fontFamily: 'Chicle',
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.01, 0.64),
                          child: InkWell(
                            onTap: () {
                              replay();
                            },
                            child: Container(
                              width: 80,
                              height: 110,
                              //color: Colors.black26,
                            ),
                          ),
                        ),
                      ],
                    ))
            ],
          ),
        ])));
  }
}
