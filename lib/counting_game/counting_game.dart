import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CountingGame extends StatefulWidget {
  const CountingGame({Key key}) : super(key: key);

  @override
  State<CountingGame> createState() => _CountingGameState();
}

class _CountingGameState extends State<CountingGame> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
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

  int score = 0;
  bool gameOver = false;
  var randomNumber = 0;
  var answer = 0;
  var answerPosition = 0;
  var A1 = 0, A2 = 0, A3 = 0, A4 = 0;
  var randomObject;
  mainn() {
    randomObject = new Random();
    randomNumber = 1 + randomObject.nextInt(15 - 1);
    answers();
  }

  get3RandomNums(int n) {
    List list = List.generate(16, (i) => i + 1);
    list.remove(n);
    list.shuffle();

    list.take(3);

    list.add(n);
    list.shuffle();
    return list;
  }

  answers() {
    var nums = get3RandomNums(randomNumber);
    A1 = nums[0];
    A2 = nums[1];
    A3 = nums[2];
    A4 = nums[3];
  }

  reset() {
    setState(() {
      mainn();
    });
  }

  //🍨      🍦
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          'Count the Objects',
          style: TextStyle(
              fontSize: 35,
              fontFamily: GoogleFonts.lato().fontFamily,
              color: const Color.fromARGB(255, 56, 6, 142),
              fontWeight: FontWeight.w900),
        ),
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(children: [
            Container(
              // color: Colors.blue,
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 1.55,
            ),
            Image.asset(
              'assets/greenBoard.png',
              fit: BoxFit.fill,
              height: 320,
              width: 600,
            ),
            Positioned(
              top: 20,
              left: 85,
              child: Container(
                // color: Colors.blue,
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width / 2.10,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, childAspectRatio: 1.0
                            //crossAxisSpacing: 5,
                            //mainAxisSpacing: 5
                            ),
                    itemCount: randomNumber,
                    itemBuilder: (BuildContext ctx, index) {
                      return Image.asset(
                        'assets/pizzaa.png',
                      );
                    }),
              ),
            ),
            ElevatedButton(onPressed: reset, child: Text('Reset'))
          ]),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: Text(A1.toString(),
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold)),
                          ),
                          height: MediaQuery.of(context).size.height / 6.8,
                          width: MediaQuery.of(context).size.width / 5.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 53, 187, 249),
                            border: Border.all(width: 5.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Center(
                            child: Text(A2.toString(),
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold)),
                          ),
                          height: MediaQuery.of(context).size.height / 6.8,
                          width: MediaQuery.of(context).size.width / 5.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 224, 77, 250),
                            border: Border.all(width: 5.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Center(
                            child: Text(A3.toString(),
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold)),
                          ),
                          height: MediaQuery.of(context).size.height / 6.8,
                          width: MediaQuery.of(context).size.width / 5.0,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 70, 96, 244),
                            border: Border.all(width: 5.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Center(
                            child: Text(A4.toString(),
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold)),
                          ),
                          height: MediaQuery.of(context).size.height / 6.8,
                          width: MediaQuery.of(context).size.width / 5.0,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
