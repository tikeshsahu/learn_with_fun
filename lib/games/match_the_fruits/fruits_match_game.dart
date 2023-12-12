import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/games/match_the_animals/itemModel.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class FruitsMatchGame extends StatefulWidget {
  static const routeName = 'matchFruits';
  const FruitsMatchGame({Key? key}) : super(key: key);

  @override
  State<FruitsMatchGame> createState() => _FruitsMatchGameState();
}

class _FruitsMatchGameState extends ResumableState<FruitsMatchGame> {
  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
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
  List<MatchGameModel> items2 = [];
  List<MatchGameModel> newlistitems = [];
  List<MatchGameModel> items = MatchGameModel.fruitsItems;
  int score = 0;
  int flag = 0;
  bool gameOver = false;

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
    items2 = List<MatchGameModel>.from(newlistitems);
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
                    SizedBox(
                      //color: Colors.amber,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10.3,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          backButton(context),
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
                        const Spacer(flex: 2),
                        Column(
                          children: newlistitems.map((item) {
                            return Container(
                              // color: Colors.amber,
                              margin: const EdgeInsets.all(6),
                              child: Draggable<MatchGameModel>(
                                data: item,
                                childWhenDragging: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  child: item.name == 'Grapes'
                                      ? CachedNetworkImage(
                                          imageUrl: item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(
                                          item.image,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                feedback: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 6.6,
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  child: item.name == 'Grapes'
                                      ? CachedNetworkImage(
                                          imageUrl: item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(item.image,
                                          fit: BoxFit.cover),
                                ),
                                child: SizedBox(
                                  //color: Colors.amberAccent,
                                  height:
                                      MediaQuery.of(context).size.height / 6.5,
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  child: item.name == 'Grapes'
                                      ? CachedNetworkImage(
                                          imageUrl: item.image,
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
                        const Spacer(
                          flex: 3,
                        ),
                        SizedBox(
                          //color: Colors.amber,
                          child: Column(
                            children: items2.map((item) {
                              return DragTarget<MatchGameModel>(
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
                                                ? const Color.fromARGB(
                                                    255, 199, 197, 197)
                                                : const Color.fromARGB(
                                                    255, 226, 223, 223)),
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8.8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        margin: const EdgeInsets.all(24),
                                        child: Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ));
                            }).toList(),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              if (gameOver)
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        SizedBox(
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
                        gameCompletedBox(context),
                        homeButton(context),
                        Align(
                          alignment: const AlignmentDirectional(0.04, 0.33),
                          child: Container(
                            width: 126,
                            height: 38,
                            //color: Colors.black26,
                            child: Center(
                              child: Text('$score',
                                  style: const TextStyle(
                                      fontFamily: 'Chicle',
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 34)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.01, 0.64),
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

  Align gameCompletedBox(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0.2),
      child: Container(
        //color: Colors.black12,
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 1.2,
        child: Image.asset(
          'assets/gui/gameCompleted2.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Align homeButton(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.95, -0.99),
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
    );
  }

  GestureDetector backButton(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
