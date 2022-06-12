import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_game/Alphabets/alphabets_reading/alphabets_reading.dart';
import 'package:learning_game/Alphabets/alphabets_writing/alpha_writing.dart';
import 'package:learning_game/counting_game/counting_game.dart';
import 'package:learning_game/find_the_missing/missing_game.dart';
import 'package:learning_game/identify_animal_game/animal_identify.dart';
import 'package:learning_game/identify_colors/identify_colors.dart';
import 'package:learning_game/match_the_fruits/fruits_match_game.dart';
import 'package:learning_game/numbers_reading/numbers_reading.dart';
import 'package:learning_game/trial.dart';
import 'match_the_animals/match_game.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // body: Column(
      //   children: [
      //     CarouselSlider(
      //       options: CarouselOptions(height: 300.0),
      //       items: [1, 2, 3, 4, 5].map((i) {
      //         return Builder(
      //           builder: (BuildContext context) {
      //             return Container(
      //                 width: 300,
      //                 height: 150,
      //                 margin: EdgeInsets.symmetric(horizontal: 5.0),
      //                 decoration: BoxDecoration(color: Colors.amber),
      //                 child: Text(
      //                   'text $i',
      //                   style: TextStyle(fontSize: 16.0),
      //                 ));
      //           },
      //         );
      //       }).toList(),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MatchGame()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Animal'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FruitsMatchGame()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Fruits'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindTheMissing()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Missing'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountingGame()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Counting'),
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlphabetsWriting()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Write Alphabets'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdentifyAnimal()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Identify Animals'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NumbersReading()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Numbers Reading'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IdentifyColors()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Identify Colours'),
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AlphabetsLearning()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Alpha Learn'),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(height: 15,),
                   InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWidget()));
                    },
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Text('Trail'),
                      color: Colors.amber,
                    ),
                  ),
            ],
          ),]
          )
        ),
      ),
    );
  }
}
