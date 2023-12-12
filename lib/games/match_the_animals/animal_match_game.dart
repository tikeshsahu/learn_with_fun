import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_with_fun/games/match_the_animals/itemModel.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class MatchGame extends StatefulWidget {
  static const routeName = 'matchAnimals';
  const MatchGame({Key? key}) : super(key: key);

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends ResumableState<MatchGame> {
  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  void onReady() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
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
  int score = 0;
  int flag = 0;
  bool gameOver = false;
  List<MatchGameModel> items = MatchGameModel.animalsItems;

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
            child: Column(
          children: [
            if (!gameOver)
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
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
                          Text.rich(TextSpan(children: [const TextSpan(text: 'Score :  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)), TextSpan(text: '$score', style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 45))])),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black12,
                      height: MediaQuery.of(context).size.height / 1.12,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(flex: 2),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 1.15,
                              child: Column(
                                children: newlistitems.map((item) {
                                  return Container(
                                                                        margin: const EdgeInsets.all(6),
                                    child: Draggable<MatchGameModel>(
                                      data: item,
                                      childWhenDragging: SizedBox(
                                        height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                        width: MediaQuery.of(context).size.width /
                                          3.5,
                                        child: item.name == 'Cow'
                                            ? CachedNetworkImage(
                                                imageUrl: item.image,
                                                fit: BoxFit.fill,
                                              )
                                            : Lottie.network(
                                                item.image,
                                                fit: BoxFit.cover,
                                              ),
                                        // Lottie.network(
                                        //   item.image,
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      feedback: Container(
                                        height:
                                          MediaQuery.of(context).size.height /
                                              6.6,
                                        width: MediaQuery.of(context).size.width /
                                          3.4,
                                        child: item.name == 'Cow'
                                            ? CachedNetworkImage(
                                                imageUrl: item.image,
                                                fit: BoxFit.fill,
                                              )
                                            : Lottie.network(item.image,
                                              fit: BoxFit.cover),
                                      ),
                                      child: SizedBox(
                                        height:
                                          MediaQuery.of(context).size.height /
                                              6.3,
                                        width: MediaQuery.of(context).size.width /
                                          2.8,
                                        child: item.name == 'Cow'
                                            ? CachedNetworkImage(
                                                imageUrl: item.image,
                                                fit: BoxFit.fill,
                                              )
                                            : Lottie.network(item.image,
                                              fit: BoxFit.fill),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          const Spacer(
                          flex: 3,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Column(
                                children: items2.map((item) {
                                  return DragTarget<MatchGameModel>(
                                      onAccept: (receivedItem) {
                                        if (item.value == receivedItem.value) {
                                          audioCache.play('correct.wav');
                                          // audioCache.play(item.music);
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
                                            height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8.5,
                                            width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                            margin: const EdgeInsets.all(22),
                                            child: Text(
                                              item.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ));
                                }).toList(),
                                                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                            'https://img.freepik.com/free-vector/beautiful-comic-pop-art-colorful-book-design-vector_1035-14033.jpg?w=740&t=st=1658942128~exp=1658942728~hmac=3ca21f06aa046d55cc27883525a70d558a359826a066b1f5e543a4aec699bb03',
                        //'https://img.freepik.com/premium-vector/little-animals-forest_43633-4000.jpg?w=360',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0.2),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.12,
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Image.asset(
                          'assets/gui/gameCompleted2.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.95, -0.99),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.popAndPushNamed(context, 'home');
                          //pushNamed(context, 'home');
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
                        child: const SizedBox(
                          width: 80,
                          height: 110,
                          //color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        )));
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
