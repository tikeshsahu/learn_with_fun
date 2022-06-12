import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdentifyColors extends StatefulWidget {
  const IdentifyColors({Key key}) : super(key: key);

  @override
  State<IdentifyColors> createState() => _IdentifyColorsState();
}

class _IdentifyColorsState extends State<IdentifyColors> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  int acceptedData = 0;
  int score = 0;
  //bool gameOver = false;

  String result() {
    if (score == 60) {
      //player.play('success.wav');
      return 'Awesome..!!';
    } else {
      //player.play('tryAgain.wav');
      return 'Play again to get better score';
    }
  }

  // @override
  // void restartGame() {
  //   gameOver = false;
  //   score = 0;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/bg_fish.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Text(
                'Move Birds To The Correct Boxes',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Draggable(
                    data: 10,
                    child: Container(
                      //color: Colors.black,
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/ybb.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    feedback: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/ybb.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(width: 20),
                  Draggable(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/rbb.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        'assets/rbb.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Draggable(
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/bbb.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    feedback: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/bbb.png'),
                    ),
                  ),
                  Text('Score - $score')
                ],
              ),
              // SizedBox(
              //   height: 65,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 100,
                        width: 200,
                        color: Colors.red,
                        child: Center(
                            child: Text(
                          '$acceptedData',
                          style: TextStyle(fontSize: 40),
                        )),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        score += 10;
                      });
                    },
                  ),
                  DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 100,
                        width: 200,
                        color: Colors.blue,
                        child: Center(
                            child: Text(
                          '$acceptedData',
                          style: TextStyle(fontSize: 40),
                        )),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        score += 10;
                      });
                    },
                  ),
                  DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 100,
                        width: 200,
                        color: Colors.yellow,
                        child: Center(
                            child: Text(
                          '$acceptedData',
                          style: TextStyle(fontSize: 40),
                        )),
                      );
                    },
                    onAccept: (int data) {
                      setState(() {
                        score += 10;
                      });
                    },
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
