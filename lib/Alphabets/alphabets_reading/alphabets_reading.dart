import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/services.dart';
import 'class.dart';

class AlphabetsLearning extends StatefulWidget {
  const AlphabetsLearning({Key key}) : super(key: key);

  @override
  State<AlphabetsLearning> createState() => _AlphabetsLearningState();
}

class _AlphabetsLearningState extends State<AlphabetsLearning> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    //print(alphabets[0].getAlphabet);
    mainn();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  AudioCache audioCache = AudioCache();
  bool isPressed = false;
  AnimationController _controller;
  var alphabets = [];
  // final List<AlphabetsReadingModel> alphabet = List.generate(
  //     26,
  //     (index) => AlphabetsReadingModel(
  //         alphabet: String.fromCharCode(index),
  //         value: 'a',
  //         pronounciation: 'aaaa')).toList();

  void mainn() {
    for (var i = 65; i <= 90; i++) {
      alphabets.add(new AlphabetsReadingModel(
          alphabet: String.fromCharCode(i),
          value: String.fromCharCode(i).toLowerCase(),
          pronounciation: 'asd'));
      print(alphabets);
    }
    // for (var i = 0; i < 26; i++) {
    //   print(alphabets[i].getAlphabet());
    // }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.white;
    Offset distance = isPressed ? Offset(8, 8) : Offset(28, 28);
    double blur = isPressed ? 3.0 : 30.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Lets Learn Alphabets',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.lime),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Stack(children: [
                Container(
                  //child: Text('$alphabet'),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 125,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: alphabets.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              // onTap: () =>
                              //     setState(() => isPressed = !isPressed),
                              child: Text(
                                //alphabets[index].getAlphabet,
                                'mmmm',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: blur,
                                      offset: -distance,
                                      color: Color.fromARGB(255, 249, 247, 247),
                                      inset: isPressed),
                                  BoxShadow(
                                      blurRadius: blur,
                                      offset: distance,
                                      color: Color.fromARGB(255, 147, 140, 140),
                                      inset: isPressed)
                                ]),
                          ),
                        );
                      }),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
