// import 'dart:math';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:confetti/confetti.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:learning_game/home.dart';
// import 'package:lottie/lottie.dart';

// class ProGame extends StatefulWidget {
//   static const routeName = 'proGame';
//   const ProGame({Key key}) : super(key: key);

//   @override
//   State<ProGame> createState() => _ProGameState();
// }

// class _ProGameState extends State<ProGame> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);

//     suffleAndSetAnswer();
//     // vehicles.shuffle();
//     print(ansIndex);
//   }

//   int ansIndex;

//   suffleAndSetAnswer() {
//     pros.shuffle();

//     var newRandom = Random();
//     var random = 1 + newRandom.nextInt(4 - 1);
//     ansIndex = random;
//   }

//   replay() {
//     setState(() {
//       score = 0;
//       gameOver = false;
//       suffleAndSetAnswer();
//     });
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }

//   List<Prof> pros = [
//     Prof(
//       name: 'Astronaut',
//       image:
//           'https://img.freepik.com/free-vector/astronaut-mars-landscape-scene_1308-31552.jpg?t=st=1657695288~exp=1657695888~hmac=0d70d281eaf58d45a82708bea9da3ac3edfa3a8be23359a417ad8a3646bf4dec&w=1380',
//     ),
//     Prof(
//       name: 'Doctor',
//       image:
//           'https://img.freepik.com/free-vector/empty-big-heart-banner-with-two-doctors-cartoon-character_1308-56423.jpg?t=st=1657695510~exp=1657696110~hmac=d81ab8f494849524e65c8a0d81a3b7f91a00f7726286371743ef072cc25f1412&w=996',
//     ),
//     Prof(
//       name: 'Farmer',
//       image:
//           'https://img.freepik.com/premium-vector/indian-agriculture-landscape-farmer-working-indian-rice-fields-rural-worker-vector-cartoon-backg_1396-599.jpg?w=1060',
//     ),
//     Prof(
//       name: 'Police',
//       image:
//           'https://img.freepik.com/premium-vector/cartoon-character-thai-police_49924-117.jpg?w=740',
//     ),
//     Prof(
//       name: 'Fire Fighter',
//       image:
//           'https://img.freepik.com/free-vector/flat-illustration-firefighters-putting-out-fire_23-2149131220.jpg?t=st=1657695610~exp=1657696210~hmac=2e179e33d9756bfad33d98870e49a96b368a42c5b4dc12d3daf4660fa3d48d41&w=1060',
//     ),
//     Prof(
//       name: 'Soldier',
//       image:
//           'https://img.freepik.com/premium-vector/group-army-men-woman-camouflage-combat-uniform-saluting_180264-3.jpg?w=1060',
//     ),
//     Prof(
//       name: 'Pilot',
//       image:
//           'https://img.freepik.com/premium-vector/two-pilots-background-passenger-aircraft-airport-ship-captain-co-pilot-airline-employees-vector-illustration-flat-style_165429-1136.jpg?w=1380',
//     ),
//     Prof(
//       name: 'Teacher',
//       image:
//           'https://img.freepik.com/free-vector/man-teacher-classroom_24877-50508.jpg?t=st=1657695960~exp=1657696560~hmac=0ce66a915aa801f7025cad49af150770c49dd2400b6196eae5ea439ab714a7e8&w=740',
//     ),
//     Prof(
//       name: 'Scientist',
//       image:
//           'https://img.freepik.com/free-vector/scientists-working-concept_23-2148488316.jpg?t=st=1657696089~exp=1657696689~hmac=c35ad841921c4d15ab7e765217813444738d9510fd30698313990b7dd4f2dcbf&w=740',
//     ),
//   ];

//   int score = 0;
//   bool gameOver = false;
//   final controller = ConfettiController();

//   @override
//   Widget build(BuildContext context) {
//     if (score == 60) gameOver = true;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             if (!gameOver)
//               Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(20),
//                         margin: EdgeInsets.all(10),
//                         height: MediaQuery.of(context).size.height / 1.6,
//                         width: MediaQuery.of(context).size.width / 2.1,
//                         child:
//                             //Lottie.network(vehicles[ansIndex].image),
//                             CachedNetworkImage(
//                           //fit: BoxFit.fill,
//                           imageUrl: pros[ansIndex].image,
//                           progressIndicatorBuilder:
//                               (context, url, downloadProgress) =>
//                                   CircularProgressIndicator(
//                                       value: downloadProgress.progress),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.redAccent,
//                             border: Border.all(color: Colors.pink, width: 10),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black54, offset: Offset(5, 5))
//                             ]),
//                       ),
//                       SizedBox(
//                         width: 55,
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height / 1.6,
//                         width: MediaQuery.of(context).size.width / 3,
//                         //color: Colors.amber,
//                         child: ListView.builder(
//                             itemCount: 4,
//                             itemBuilder: (BuildContext ctx, index) {
//                               return Column(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       if (pros[ansIndex].name ==
//                                           pros[index].name) {
//                                         setState(() {
//                                           showDialog(
//                                               context: context,
//                                               builder: (_) => Center(
//                                                     child: Lottie.network(
//                                                         'https://assets4.lottiefiles.com/packages/lf20_56Jc5o.json'),
//                                                   ));
//                                           suffleAndSetAnswer();
//                                           score += 10;
//                                         });
//                                       }
//                                     },
//                                     child: Container(
//                                       child: Center(
//                                         child: Text(pros[index].name,
//                                             style: TextStyle(
//                                                 fontSize: 35,
//                                                 fontWeight: FontWeight.bold)),
//                                       ),
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               7.7,
//                                       //width: MediaQuery.of(context).size.width / 3.7,
//                                       decoration: BoxDecoration(
//                                         color: Colors.redAccent,
//                                         border: Border.all(
//                                             color: Colors.pink, width: 5.0),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(12.0)),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 12,
//                                   )
//                                 ],
//                               );
//                             }),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             if (gameOver)
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: Image.network(
//                       'https://img.freepik.com/free-vector/hand-painted-watercolor-abstract-watercolor-background_23-2149005675.jpg?t=st=1658739695~exp=1658740295~hmac=edb7b47b3b46e3d6b49382738f7e700c96d6ef5814d67b230ecc0637b4e51fae&w=900',
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Align(
//                         alignment: AlignmentDirectional(0, 0.2),
//                         child: Container(
//                           //color: Colors.amber,
//                           height: MediaQuery.of(context).size.height / 1.05,
//                           width: MediaQuery.of(context).size.width / 1.5,
//                           child: Image.asset(
//                             'assets/gui/gameCompleted3.png',
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(-0.195, 0.68),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacementNamed(context, 'home');
//                           },
//                           child: Container(
//                             width: 86,
//                             height: 40,
//                             //color: Colors.black12,
//                             child: Center(
//                               child: Text('Home',
//                                   style: TextStyle(
//                                       fontFamily: 'Chicle',
//                                       letterSpacing: 1.8,
//                                       color: Colors.yellow,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 27)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.215, 0.68),
//                         child: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               replay();
//                             });
//                           },
//                           child: Container(
//                             width: 86,
//                             height: 40,
//                             //color: Colors.black12,
//                             child: Center(
//                               child: Text('Replay',
//                                   style: TextStyle(
//                                       fontFamily: 'Chicle',
//                                       letterSpacing: 1.8,
//                                       color: Colors.yellow,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 27)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.02, 0.32),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           //color: Colors.black12,
//                           child: Center(
//                             child: Text('$score',
//                                 style: TextStyle(
//                                     fontFamily: 'Chicle',
//                                     color: Colors.teal,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 40)),
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: ConfettiWidget(
//                           maxBlastForce: 6,
//                         minBlastForce: 2,
//                         numberOfParticles: 8,
//                         confettiController: controller,
//                         shouldLoop: false,
//                         blastDirectionality: BlastDirectionality.explosive,
//                         emissionFrequency: 0.050,
//                         ),
//                       )
//                     ],
//                   ),
//                 ]),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Prof {
//   final String name;
//   final String image;

//   Prof({this.name, this.image});
// }
