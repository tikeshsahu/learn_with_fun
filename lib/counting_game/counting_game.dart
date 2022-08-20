// import 'dart:math';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:confetti/confetti.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';

// class CountingGame extends StatefulWidget {
//   static const routeName = 'countingGame';
//   const CountingGame({Key key}) : super(key: key);

//   @override
//   State<CountingGame> createState() => _CountingGameState();
// }

// class _CountingGameState extends State<CountingGame> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
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

//   final controller = ConfettiController();
//   int score = 0;
//   bool gameOver = false;
//   var randomNumber = 0;
//   var answer = 0;
//   var answerPosition = 0;
//   var A1 = 0, A2 = 0, A3 = 0, A4 = 0;
//   var randomObject;
//   mainn() {
//     randomObject = new Random();
//     randomNumber = 1 + randomObject.nextInt(9 - 1);
//     answers();
//   }

//   get3RandomNums(int n) {
//     var newList = [];
//     List list = List.generate(10, (i) => i + 1);
//     list.remove(n);
//     list.shuffle();

//     newList = list.take(3).toList();

//     newList.add(n);
//     newList.shuffle();
//     return newList;
//   }

//   answers() {
//     var nums = get3RandomNums(randomNumber);
//     A1 = nums[0];
//     A2 = nums[1];
//     A3 = nums[2];
//     A4 = nums[3];
//   }

//   reset() {
//     setState(() {
//       mainn();
//     });
//   }

//   replay() {
//     setState(() {
//       score = 0;
//       gameOver = false;
//       mainn();
//     });
//   }

//   //🍨      🍦
//   @override
//   Widget build(BuildContext context) {
//     if (score == 50) gameOver = true;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //     centerTitle: true,
//       //     elevation: 0,
//       //     backgroundColor: Colors.white,
//       //     title: Text(
//       //       'Count the Objects',
//       //       style: TextStyle(
//       //           fontSize: 35,
//       //           fontFamily: GoogleFonts.lato().fontFamily,
//       //           color: const Color.fromARGB(255, 56, 6, 142),
//       //           fontWeight: FontWeight.w900),
//       //     ),
//       //     automaticallyImplyLeading: false,
//       //     leading: GestureDetector(
//       //       onTap: () {
//       //         Navigator.pushReplacementNamed(context, 'home');
//       //       },
//       //       child: Padding(
//       //         padding: const EdgeInsets.all(5.0),
//       //         child: Image.asset('assets/gui/homu.png'),
//       //       ),
//       //     )),
//       body: Column(
//         children: [
//           if (!gameOver)
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Stack(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: CachedNetworkImage(
//                         imageUrl:
//                             'https://img.freepik.com/premium-vector/lose-neon-text-stand-losing-game-neon-light-icon-game-esports-gameplay-gaming-session-end-gl_104045-2027.jpg?w=900',
//                         fit: BoxFit.fill),
//                   ),
//                   Align(
//                     alignment: AlignmentDirectional(0, 0),
//                     child: Container(
//                       color: Colors.amber,
//                       height: 60,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           // Row(
//           //   children: [
//           //     Stack(children: [
//           //       Container(
//           //         // color: Colors.blue,
//           //         height: MediaQuery.of(context).size.width / 3,
//           //         width: MediaQuery.of(context).size.width / 1.55,
//           //       ),
//           //       Image.asset(
//           //         'assets/greenBoard.png',
//           //         fit: BoxFit.fill,
//           //         height: 320,
//           //         width: 600,
//           //       ),
//           //       Positioned(
//           //         top: 20,
//           //         left: 85,
//           //         child: Container(
//           //           // color: Colors.blue,
//           //           height: MediaQuery.of(context).size.height / 1.8,
//           //           width: MediaQuery.of(context).size.width / 2.10,
//           //           child: GridView.builder(
//           //               gridDelegate:
//           //                   const SliverGridDelegateWithFixedCrossAxisCount(
//           //                       crossAxisCount: 4, childAspectRatio: 1.0
//           //                       //crossAxisSpacing: 5,
//           //                       //mainAxisSpacing: 5
//           //                       ),
//           //               itemCount: randomNumber,
//           //               itemBuilder: (BuildContext ctx, index) {
//           //                 return Image.asset(
//           //                   'assets/pizzaa.png',
//           //                 );
//           //               }),
//           //         ),
//           //       ),
//           //       ElevatedButton(
//           //           onPressed: () {
//           //             reset;
//           //           },
//           //           child: Text('Reset'))
//           //     ]),
//           //     //     Column(
//           //     //       children: [
//           //     //         Container(
//           //     //           child: Center(
//           //     //             child: Text(A1.toString(),
//           //     //                 style: TextStyle(
//           //     //                     fontSize: 45, fontWeight: FontWeight.bold)),
//           //     //           ),
//           //     //           height: MediaQuery.of(context).size.height / 6.8,
//           //     //           width: MediaQuery.of(context).size.width / 5.0,
//           //     //           decoration: BoxDecoration(
//           //     //             color: Color.fromARGB(255, 53, 187, 249),
//           //     //             border: Border.all(width: 5.0),
//           //     //             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//           //     //           ),
//           //     //         ),
//           //     //         SizedBox(
//           //     //           height: 15,
//           //     //         ),
//           //     //         Container(
//           //     //           child: Center(
//           //     //             child: Text(A2.toString(),
//           //     //                 style: TextStyle(
//           //     //                     fontSize: 45, fontWeight: FontWeight.bold)),
//           //     //           ),
//           //     //           height: MediaQuery.of(context).size.height / 6.8,
//           //     //           width: MediaQuery.of(context).size.width / 5.0,
//           //     //           decoration: BoxDecoration(
//           //     //             color: Color.fromARGB(255, 224, 77, 250),
//           //     //             border: Border.all(width: 5.0),
//           //     //             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//           //     //           ),
//           //     //         ),
//           //     //         SizedBox(
//           //     //           height: 15,
//           //     //         ),
//           //     //         Container(
//           //     //           child: Center(
//           //     //             child: Text(A3.toString(),
//           //     //                 style: TextStyle(
//           //     //                     fontSize: 45, fontWeight: FontWeight.bold)),
//           //     //           ),
//           //     //           height: MediaQuery.of(context).size.height / 6.8,
//           //     //           width: MediaQuery.of(context).size.width / 5.0,
//           //     //           decoration: BoxDecoration(
//           //     //             color: Color.fromARGB(255, 70, 96, 244),
//           //     //             border: Border.all(width: 5.0),
//           //     //             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//           //     //           ),
//           //     //         ),
//           //     //         SizedBox(
//           //     //           height: 15,
//           //     //         ),
//           //     //         Container(
//           //     //           child: Center(
//           //     //             child: Text(A4.toString(),
//           //     //                 style: TextStyle(
//           //     //                     fontSize: 45, fontWeight: FontWeight.bold)),
//           //     //           ),
//           //     //           height: MediaQuery.of(context).size.height / 6.8,
//           //     //           width: MediaQuery.of(context).size.width / 5.0,
//           //     //           decoration: BoxDecoration(
//           //     //             color: Color.fromARGB(255, 70, 96, 244),
//           //     //             border: Border.all(width: 5.0),
//           //     //             borderRadius: BorderRadius.all(Radius.circular(12.0)),
//           //     //           ),
//           //     //         )
//           //     //       ],
//           //     //     ),
//           //     SizedBox(
//           //       width: 1,
//           //     ),
//           //     Container(
//           //       height: MediaQuery.of(context).size.height / 1.6,
//           //       width: MediaQuery.of(context).size.width / 4.5,
//           //       //color: Colors.amber,
//           //       child: ListView.builder(
//           //           itemCount: 4,
//           //           itemBuilder: (BuildContext ctx, index) {
//           //             return Column(
//           //               children: [
//           //                 GestureDetector(
//           //                   onTap: () {
//           //                     // if (vehicles[ansIndex].name ==
//           //                     //     vehicles[index].name) {
//           //                     //   setState(() {
//           //                     //     showDialog(
//           //                     //         context: context,
//           //                     //         builder: (context) {
//           //                     //           Future.delayed(
//           //                     //               Duration(seconds: 3), () {
//           //                     //             Navigator.of(context)
//           //                     //                 .pop(true);
//           //                     //           });
//           //                     //           return Center(
//           //                     //               // child: Image.network(
//           //                     //               //     'https://assets4.lottiefiles.com/packages/lf20_56Jc5o.json'),
//           //                     //               child: Lottie.asset(
//           //                     //                   'assets/aaaaa.json'));
//           //                     //         });
//           //                     //     suffleAndSetAnswer();
//           //                     //     score += 10;
//           //                     //   });
//           //                     // }
//           //                   },
//           //                   child: Column(
//           //                     mainAxisAlignment: MainAxisAlignment.start,
//           //                     children: [
//           //                       Container(
//           //                         child: Center(
//           //                           child: Text(newList,
//           //                               //vehicles[index].name,
//           //                               style: TextStyle(
//           //                                   fontSize: 35,
//           //                                   fontWeight: FontWeight.bold)),
//           //                         ),
//           //                         height: MediaQuery.of(context).size.height /
//           //                             7.7,
//           //                         //width: MediaQuery.of(context).size.width / 5,
//           //                         decoration: BoxDecoration(
//           //                           color: Colors.redAccent,
//           //                           border: Border.all(
//           //                               color: Colors.pink, width: 5.0),
//           //                           borderRadius: BorderRadius.all(
//           //                               Radius.circular(12.0)),
//           //                         ),
//           //                       ),
//           //                       SizedBox(
//           //                         height: 12,
//           //                       )
//           //                     ],
//           //                   ),
//           //                 ),
//           //               ],
//           //             );
//           //           }),
//           //     ),
//           //   ],
//           // ),
//           if (gameOver)
//             Center(
//               child: Column(
//                 children: [
//                   Container(
//                       height: 200,
//                       width: 200,
//                       child: Stack(
//                         children: [
//                           Lottie.network(
//                               'https://assets8.lottiefiles.com/packages/lf20_pJo4Hp.json'),
//                           Center(
//                             child: ConfettiWidget(
//                               maxBlastForce: 10,
//                               numberOfParticles: 10,
//                               confettiController: controller,
//                               shouldLoop: true,
//                               blastDirectionality:
//                                   BlastDirectionality.explosive,
//                               emissionFrequency: 0.050,
//                             ),
//                           )
//                         ],
//                       )),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(context, 'home');
//                         },
//                         child: Container(
//                             height: 70,
//                             child: Image.asset('assets/homeButton.png')),
//                       ),
//                       SizedBox(
//                         width: 50,
//                       ),
//                       GestureDetector(
//                         onTap: replay,
//                         child: Container(
//                             height: 70,
//                             child: Image.asset('assets/replayButton.png')),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
