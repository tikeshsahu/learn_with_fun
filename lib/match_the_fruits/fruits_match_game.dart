import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_game/match_the_animals/itemModel.dart';

class FruitsMatchGame extends StatefulWidget {
  const FruitsMatchGame({Key key}) : super(key: key);

  @override
  State<FruitsMatchGame> createState() => _FruitsMatchGameState();
}

class _FruitsMatchGameState extends State<FruitsMatchGame> {
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
        value: 'banana',
        name: 'Banana',
        image: 'assets/banana.gif',
      ),
      ItemModel(
        value: 'orange',
        name: 'Orange',
        image: 'assets/orange.gif',
      ),
      ItemModel(
        value: 'pear',
        name: 'Pear',
        image: 'assets/pear.gif',
      ),
      ItemModel(
        value: 'pineapple',
        name: 'Pineapple',
        image: 'assets/pineapple.gif',
      ),
      ItemModel(
        value: 'mango',
        name: 'Mango',
        image: 'assets/mango.gif',
      ),
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
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Score :  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
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
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                                height: 120,
                                width: 120,
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
                                  height: 105,
                                  width: 140,
                                  margin: EdgeInsets.all(14),
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
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
