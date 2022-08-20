import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_game/match_the_animals/itemModel.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class MatchGame extends StatefulWidget {
  static const routeName = 'matchAnimals';
  const MatchGame({Key key}) : super(key: key);

  @override
  State<MatchGame> createState() => _MatchGameState();
}

class _MatchGameState extends ResumableState<MatchGame> {
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
  int score, flag = 0;
  bool gameOver;
  List<ItemModel> items = [
    ItemModel(
        value: 'dog',
        name: 'Dog',
        image:
            'https://assets1.lottiefiles.com/private_files/lf30_h8chtt4u.json',
        music: 'dog_voice.wav'),
    ItemModel(
        value: 'lion',
        name: 'Lion',
        image: 'https://assets6.lottiefiles.com/packages/lf20_vmollwvl.json',
        music: 'lion.mp3'),
    ItemModel(
        value: 'owl',
        name: 'Owl',
        image: 'https://assets2.lottiefiles.com/packages/lf20_xGSFL9.json',
        music: 'owl.wav'),
    ItemModel(
        value: 'elephant',
        name: 'Elephant',
        image: 'https://assets7.lottiefiles.com/packages/lf20_xgwzkywz.json',
        music: 'elephant.wav'),
    ItemModel(
        value: 'monkey',
        name: 'Monkey',
        image: 'https://assets10.lottiefiles.com/packages/lf20_gvxqafpw.json',
        music: 'monkey.wav'),
    ItemModel(
        value: 'cow',
        name: 'Cow',
        image:
            'https://i.pinimg.com/originals/a2/01/4f/a2014f435ab140e724923d6d594ca935.gif',
        music: 'cow.mp3'),
    ItemModel(
        value: 'bee',
        name: 'Bee',
        image:
            'https://assets9.lottiefiles.com/private_files/lf30_ldieofjb.json',
        music: 'bee.mp3'),
    ItemModel(
        value: 'penguin',
        name: 'Penguin',
        image: 'https://assets8.lottiefiles.com/packages/lf20_44y9y3ky.json',
        music: 'penguin.mp3'), //desktop file
    ItemModel(
        value: 'butterfly',
        name: 'Butterfly',
        image:
            'https://assets10.lottiefiles.com/private_files/lf30_ce3fctyu.json',
        music: 'butterfly.mp3'),
    ItemModel(
        value: 'caterpiller',
        name: 'Caterpiller',
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
        image:
            'https://assets2.lottiefiles.com/private_files/lf30_oiaetlzu.json',
        music: 'duck.mp3'),
    ItemModel(
        value: 'cat',
        name: 'Cat',
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
                                    fontWeight: FontWeight.bold, fontSize: 40)),
                            TextSpan(
                                text: '$score',
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45))
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
                                  child: item.name == 'Cow'
                                      ? Image.network(
                                          item.image,
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
                                      MediaQuery.of(context).size.height / 6.6,
                                  width:
                                      MediaQuery.of(context).size.width / 3.4,
                                  child: item.name == 'Cow'
                                      ? Image.network(
                                          item.image,
                                          fit: BoxFit.fill,
                                        )
                                      : Lottie.network(item.image,
                                          fit: BoxFit.cover),
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6.3,
                                  width:
                                      MediaQuery.of(context).size.width / 2.8,
                                  child: item.name == 'Cow'
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
                                                ? Color.fromARGB(
                                                    255, 199, 197, 197)
                                                : Color.fromARGB(
                                                    255, 226, 223, 223)),
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                8.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        margin: EdgeInsets.all(22),
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
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
                              'https://img.freepik.com/free-vector/beautiful-comic-pop-art-colorful-book-design-vector_1035-14033.jpg?w=740&t=st=1658942128~exp=1658942728~hmac=3ca21f06aa046d55cc27883525a70d558a359826a066b1f5e543a4aec699bb03',
                          //'https://img.freepik.com/premium-vector/little-animals-forest_43633-4000.jpg?w=360',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0.2),
                        child: Container(
                          //color: Colors.black12,
                          width: MediaQuery.of(context).size.width / 1.12,
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
                  ),
                ),
            ],
          ),
        ])));
  }
}
