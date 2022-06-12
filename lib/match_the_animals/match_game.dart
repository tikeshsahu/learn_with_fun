import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_game/match_the_animals/itemModel.dart';

class MatchGame extends StatefulWidget {
  const MatchGame({Key key}) : super(key: key);

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends State<MatchGame> {
  void initState() {
  super.initState();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  initGame();
}

@override
dispose() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  super.dispose();
}

  AudioCache audioCache = AudioCache();
  List<ItemModel> items;
  List<ItemModel> items2;
  int score;
  bool gameOver;

  @override
  void initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          value: 'dog',
          name: 'Dog',
          image: 'assets/dog.png',
          music: 'dog_voice.wav'),
      ItemModel(
          value: 'lion',
          name: 'Lion',
          image: 'assets/lion.png',
          music: 'tiger.wav'),
      ItemModel(
          value: 'owl', name: 'Owl', image: 'assets/owl.png', music: 'owl.wav'),
      ItemModel(
          value: 'elephant',
          name: 'Elephant',
          image: 'assets/elephant.png',
          music: 'elephant.wav'),
      ItemModel(
          value: 'monkey',
          name: 'Monkey',
          image: 'assets/monkey.png',
          music: 'monkey.wav'),
      ItemModel(
          value: 'panda',
          name: 'Panda',
          image: 'assets/panda.png',
          music: 'panda.wav'),
    ];
    items2 = List<ItemModel>.from(items);

    items.shuffle();
    items2.shuffle();
  }

  // @override
  // void initState() {
  //   super.initState();

  //   initGame();
  // }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
    //audioCache.play('continue.wav',volume: 75);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Score :  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              TextSpan(
                  text: '$score',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 40))
            ])),
          ),
          if (!gameOver)
            Row(
              children: [
                Spacer(),
                Column(
                  children: items.map((item) {
                    return Container(
                      //color: Colors.amber,
                      margin: EdgeInsets.all(6),
                      child: Draggable<ItemModel>(
                          data: item,
                          childWhenDragging: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(item.image),
                            radius: 55,
                          ),
                          feedback: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(item.image),
                            radius: 40,
                          ),
                          child: Container(
                            child: Image.asset(item.image),
                            height: 110,
                            width: 110,
                          )
                          // CircleAvatar(
                          //   backgroundColor: Colors.white,
                          //   backgroundImage: AssetImage(item.image),
                          //   radius: 40,
                          // ),
                          ),
                    );
                  }).toList(),
                ),
                Spacer(
                  flex: 3,
                ),
                Column(
                  children: items2.map((item) {
                    return DragTarget<ItemModel>(
                        onAccept: (receivedItem) {
                          if (item.value == receivedItem.value) {
                            audioCache.play('correct.wav');
                            audioCache.play(item.music);
                            setState(() {
                              items.remove(receivedItem);
                              items2.remove(item);
                            });
                            score += 10;
                            item.accepting = false;
                          } else {
                            audioCache.play('wrong.wav');
                            setState(() {
                              score -= 5;
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
                        builder: (context, acceptedItems, rejectedItems) =>
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: item.accepting
                                      ? Color.fromARGB(255, 199, 197, 197)
                                      : Color.fromARGB(255, 226, 223, 223)),
                              alignment: Alignment.center,
                              // height: MediaQuery.of(context).size.width / 6.2,
                              // width: MediaQuery.of(context).size.width / 3,
                              height: 90,
                              width: 130,
                              margin: EdgeInsets.all(14),
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
                Spacer(),
              ],
            ),
          if (gameOver)
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Game Over',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(result()),
                  )
                ],
              ),
            ),
          if (gameOver)
            Container(
              height: MediaQuery.of(context).size.width / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      initGame();
                    });
                  },
                  child: Text("New Game")),
            )
        ],
      ),
    )));
  }

  String result() {
    if (score == 100) {
      //player.play('success.wav');
      return 'Awesome..!!';
    } else {
      //player.play('tryAgain.wav');
      return 'Play again to get better score';
    }
  }
}
