// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:learning_game/find_the_missing/missing_item_model.dart';
// import 'dart:math';

// class FindTheMissing extends StatefulWidget {
//   static const routeName = 'missingGame';
//   const FindTheMissing({Key key}) : super(key: key);

//   @override
//   State<FindTheMissing> createState() => _FindTheMissingState();
// }

// class _FindTheMissingState extends State<FindTheMissing> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     gameOver = false;
//     mainn();
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }

//   AudioCache audioCache = AudioCache();
//   var B1 = 0, B2 = 0, B3 = 0, B4 = 0;
//   var A1 = 0, A2 = 0, A3 = 0, A4 = 0;
//   var RN, flag, flagdrag, ans;
//   var answer = 0;
//   int score = 0;
//   bool gameOver;
//   mainn() {
//     //Random rnd;
//     int min = 1;
//     int max = 17;
//     var rnd = new Random();
//     B1 = min + rnd.nextInt(max - min);
//     B2 = B1 + 1;
//     B3 = B1 + 2;
//     B4 = B1 + 3;

//     var newRandom = new Random();
//     RN = min + newRandom.nextInt(4 - min);

//     switch (RN) {
//       case 1:
//         {
//           answer = B1;
//           break;
//         }
//       case 2:
//         {
//           answer = B2;
//           break;
//         }
//       case 3:
//         {
//           answer = B3;
//           break;
//         }
//       case 4:
//         {
//           answer = B4;
//           break;
//         }
//     }
//     answers();
//   }

//   answers() {
//     var newRandom = new Random();
//     ans = 1 + newRandom.nextInt(4 - 1);
//     switch (ans) {
//       case 1:
//         {
//           A1 = answer;
//           A2 = 1 + newRandom.nextInt(17 - 1);
//           A3 = 1 + newRandom.nextInt(17 - 1);
//           A4 = 1 + newRandom.nextInt(17 - 1);

//           break;
//         }
//       case 2:
//         {
//           A2 = answer;
//           A1 = 1 + newRandom.nextInt(17 - 1);
//           A3 = 1 + newRandom.nextInt(17 - 1);
//           A4 = 1 + newRandom.nextInt(17 - 1);
//           break;
//         }
//       case 3:
//         {
//           A3 = answer;
//           A2 = 1 + newRandom.nextInt(17 - 1);
//           A1 = 1 + newRandom.nextInt(17 - 1);
//           A4 = 1 + newRandom.nextInt(17 - 1);
//           break;
//         }
//       case 4:
//         {
//           A4 = answer;
//           A2 = 1 + newRandom.nextInt(17 - 1);
//           A3 = 1 + newRandom.nextInt(17 - 1);
//           A1 = 1 + newRandom.nextInt(17 - 1);
//           break;
//         }
//     }
//   }

//   String result() {
//     if (score == 60) {
//       //player.play('success.wav');
//       return 'Awesome..!!';
//     } else {
//       //player.play('tryAgain.wav');
//       return 'Play again to get better score';
//     }
//   }

//   @override
//   void restartGame() {
//     gameOver = false;
//     score = 0;
//     mainn();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (score == 60) gameOver = true;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
        
//           elevation: 0,
//           backgroundColor: Colors.white,
//           automaticallyImplyLeading: false,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pushReplacementNamed(context, 'home');
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Image.asset('assets/homeButton.png'),
//             ),
//           )),
//       body: SafeArea(
//           child: Column(
//         children: [
//           if (gameOver)
//             Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(
//                       'Game Over',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.red),
//                     ),
//                   ),
//                   Text.rich(TextSpan(children: [
//                     TextSpan(
//                         text: 'Score :  ',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 35)),
//                     TextSpan(
//                         text: '$score',
//                         style: TextStyle(
//                             color: Colors.teal,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40))
//                   ])),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(result()),
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.width / 10,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             restartGame();
//                           });
//                         },
//                         child: Text(
//                           "New Game",
//                           style: TextStyle(color: Colors.red),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           if (!gameOver)
//             Stack(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height / 1.077,
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.asset(
//                     'assets/background_image.png',
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/scorecard_rocket.gif',
//                           height: 60,
//                           width: 70,
//                         ),
//                         Text.rich(TextSpan(children: [
//                           TextSpan(
//                               text: 'Score :  ',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 35)),
//                           TextSpan(
//                               text: '$score',
//                               style: TextStyle(
//                                   color: Colors.teal,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 40))
//                         ])),
//                         Image.asset(
//                           'assets/scorecard_rocket.gif',
//                           height: 60,
//                           width: 70,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Stack(children: [
//                           DragTarget(
//                               onAccept: (recievedItem) {
//                                 if (flagdrag == ans) {
//                                   audioCache.play('correct.wav');
//                                   setState(() {
//                                     mainn();
//                                     score += 10;
//                                   });
//                                 } else {
//                                   audioCache.play('wrong.wav');
//                                   setState(() {
//                                     score - 5;
//                                   });
//                                 }
//                               },
//                               builder:
//                                   (context, acceptedItems, rejectedItems) =>
//                                       Stack(children: [
//                                         Image.asset(
//                                           'assets/balloon.gif',
//                                           height: 150,
//                                           width: 135,
//                                         ),
//                                         Positioned(
//                                           top: 38,
//                                           left: 45,
//                                           child: Stack(children: [
//                                             Text(
//                                               RN == 1 ? "?" : B1.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 foreground: Paint()
//                                                   ..style = PaintingStyle.stroke
//                                                   ..strokeWidth = 6
//                                                   ..color = Colors.blue[700],
//                                               ),
//                                             ),
//                                             Text(
//                                               RN == 1 ? "?" : B1.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 color: Colors.grey[300],
//                                               ),
//                                             ),
//                                           ]
//                                               //)
//                                               ),
//                                         ),
//                                       ]))
//                         ]),
//                         Stack(children: [
//                           DragTarget(
//                               onAccept: (recievedItem) {
//                                 audioCache.play('correct.wav');
//                                 if (flagdrag == ans) {
//                                   setState(() {
//                                     mainn();
//                                     score += 10;
//                                   });
//                                 } else {
//                                   audioCache.play('wrong.wav');
//                                   setState(() {
//                                     score - 5;
//                                   });
//                                 }
//                               },
//                               builder:
//                                   (context, acceptedItems, rejectedItems) =>
//                                       Stack(children: [
//                                         Image.asset(
//                                           'assets/balloon.gif',
//                                           height: 150,
//                                           width: 135,
//                                         ),
//                                         Positioned(
//                                           top: 38,
//                                           left: 50,
//                                           child: Stack(children: [
//                                             Text(
//                                               RN == 2 ? "?" : B2.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 foreground: Paint()
//                                                   ..style = PaintingStyle.stroke
//                                                   ..strokeWidth = 6
//                                                   ..color = Colors.blue[700],
//                                               ),
//                                             ),
//                                             Text(
//                                               RN == 2 ? "?" : B2.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 color: Colors.grey[300],
//                                               ),
//                                             ),
//                                           ]
//                                               //)
//                                               ),
//                                         ),
//                                       ]))
//                         ]),
//                         Stack(children: [
//                           DragTarget(
//                               onAccept: (recievedItem) {
//                                 if (flagdrag == ans) {
//                                   audioCache.play('correct.wav');
//                                   setState(() {
//                                     mainn();
//                                     score += 10;
//                                   });
//                                 } else {
//                                   audioCache.play('wrong.wav');
//                                   setState(() {
//                                     score - 5;
//                                   });
//                                 }
//                               },
//                               builder:
//                                   (context, acceptedItems, rejectedItems) =>
//                                       Stack(children: [
//                                         Image.asset(
//                                           'assets/balloon.gif',
//                                           height: 150,
//                                           width: 135,
//                                         ),
//                                         Positioned(
//                                           top: 38,
//                                           right: 49,
//                                           child: Stack(children: [
//                                             Text(
//                                               RN == 3 ? "?" : B3.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 foreground: Paint()
//                                                   ..style = PaintingStyle.stroke
//                                                   ..strokeWidth = 6
//                                                   ..color = Colors.blue[700],
//                                               ),
//                                             ),
//                                             Text(
//                                               RN == 3 ? "?" : B3.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 color: Colors.grey[300],
//                                               ),
//                                             ),
//                                           ]
//                                               //)
//                                               ),
//                                         ),
//                                       ]))
//                         ]),
//                         Stack(children: [
//                           DragTarget(
//                               onAccept: (recievedItem) {
//                                 if (flagdrag == ans) {
//                                   audioCache.play('correct.wav');
//                                   setState(() {
//                                     mainn();
//                                     score += 10;
//                                   });
//                                 } else {
//                                   audioCache.play('wrong.wav');
//                                   setState(() {
//                                     score - 5;
//                                   });
//                                 }
//                               },
//                               builder:
//                                   (context, acceptedItems, rejectedItems) =>
//                                       Stack(children: [
//                                         Image.asset(
//                                           'assets/balloon.gif',
//                                           height: 150,
//                                           width: 135,
//                                         ),
//                                         Positioned(
//                                           top: 38,
//                                           right: 49,
//                                           child: Stack(children: [
//                                             Text(
//                                               RN == 4 ? "?" : B4.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 foreground: Paint()
//                                                   ..style = PaintingStyle.stroke
//                                                   ..strokeWidth = 6
//                                                   ..color = Colors.blue[700],
//                                               ),
//                                             ),
//                                             Text(
//                                               RN == 4 ? "?" : B4.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 43,
//                                                 color: Colors.grey[300],
//                                               ),
//                                             ),
//                                           ]),
//                                         ),
//                                       ]))
//                         ]),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           child: Stack(children: [
//                             Image.asset(
//                               'assets/wodden_boardd.png',
//                               height: 128,
//                               width: 125,
//                             ),
//                             Positioned(
//                               bottom: 2,
//                               left: 34,
//                               child: Draggable(
//                                   onDragStarted: () => flagdrag = 1,
//                                   //data:
//                                   childWhenDragging: Container(
//                                     child: Text(
//                                       A1.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   feedback: Container(
//                                     child: Text(
//                                       A1.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   child: Container(
//                                     child: Text(
//                                       A1.toString(),
//                                       style: TextStyle(
//                                           shadows: [
//                                             Shadow(
//                                               color: Colors.blue,
//                                               blurRadius: 10.0,
//                                               offset: Offset(5.0, 5.0),
//                                             ),
//                                             Shadow(
//                                               color: Colors.red,
//                                               blurRadius: 10.0,
//                                               offset: Offset(-5.0, 5.0),
//                                             ),
//                                           ],
//                                           color: Colors.black,
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   )),
//                             ),
//                           ]),
//                         ),
//                         SizedBox(
//                           width: 45,
//                         ),
//                         Container(
//                           child: Stack(children: [
//                             Image.asset(
//                               'assets/wodden_boardd.png',
//                               height: 128,
//                               width: 125,
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               left: 35,
//                               child: Draggable(
//                                   onDragStarted: () => flagdrag = 2,
//                                   //data:
//                                   childWhenDragging: Container(
//                                     child: Text(
//                                       A2.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   feedback: Container(
//                                     child: Text(
//                                       A2.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   child: Container(
//                                     child: Text(
//                                       A2.toString(),
//                                       style: TextStyle(
//                                           shadows: [
//                                             Shadow(
//                                               color: Colors.blue,
//                                               blurRadius: 10.0,
//                                               offset: Offset(5.0, 5.0),
//                                             ),
//                                             Shadow(
//                                               color: Colors.red,
//                                               blurRadius: 10.0,
//                                               offset: Offset(-5.0, 5.0),
//                                             ),
//                                           ],
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   )),
//                             ),
//                           ]),
//                         ),
//                         SizedBox(
//                           width: 45,
//                         ),
//                         Container(
//                           child: Stack(children: [
//                             Image.asset(
//                               'assets/wodden_boardd.png',
//                               height: 128,
//                               width: 125,
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               left: 38,
//                               child: Draggable(
//                                   onDragStarted: () => flagdrag = 3,
//                                   //data:
//                                   childWhenDragging: Container(
//                                     child: Text(
//                                       A3.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   feedback: Container(
//                                     child: Text(
//                                       A3.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   child: Container(
//                                     child: Text(
//                                       A3.toString(),
//                                       style: TextStyle(
//                                           shadows: [
//                                             Shadow(
//                                               color: Colors.blue,
//                                               blurRadius: 10.0,
//                                               offset: Offset(5.0, 5.0),
//                                             ),
//                                             Shadow(
//                                               color: Colors.red,
//                                               blurRadius: 10.0,
//                                               offset: Offset(-5.0, 5.0),
//                                             ),
//                                           ],
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   )),
//                             ),
//                           ]),
//                         ),
//                         SizedBox(
//                           width: 45,
//                         ),
//                         Container(
//                           child: Stack(children: [
//                             Image.asset(
//                               'assets/wodden_boardd.png',
//                               height: 128,
//                               width: 125,
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               left: 28,
//                               child: Draggable(
//                                   onDragStarted: () => flagdrag = 4,
//                                   //data:
//                                   childWhenDragging: Container(
//                                     child: Text(
//                                       A4.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   feedback: Container(
//                                     child: Text(
//                                       A4.toString(),
//                                       style: TextStyle(
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   ),
//                                   child: Container(
//                                     child: Text(
//                                       A4.toString(),
//                                       style: TextStyle(
//                                           shadows: [
//                                             Shadow(
//                                               color: Colors.blue,
//                                               blurRadius: 10.0,
//                                               offset: Offset(5.0, 5.0),
//                                             ),
//                                             Shadow(
//                                               color: Colors.red,
//                                               blurRadius: 10.0,
//                                               offset: Offset(-5.0, 5.0),
//                                             ),
//                                           ],
//                                           fontSize: 55,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     height: 110,
//                                     width: 110,
//                                   )),
//                             ),
//                           ]),
//                         ),
//                       ],
//                     ),

//                     // if (gameOver = true)
//                     //   Container(
//                     //     height: MediaQuery.of(context).size.width / 10,
//                     //     decoration: BoxDecoration(
//                     //       borderRadius: BorderRadius.circular(8),
//                     //     ),
//                     //     child: TextButton(
//                     //         // onPressed: () {
//                     //         //   setState(() {
//                     //         //     initGame();
//                     //         //   });
//                     //         // },
//                     //         child: Text("New Game")),
//                     //   )
//                   ],
//                 ),
//               ],
//             )
//         ],
//       )),
//     );
//   }
// }
