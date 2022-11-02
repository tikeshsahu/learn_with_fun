// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class IdentifyColors extends StatefulWidget {
//   static const routeName = 'colors';
//   const IdentifyColors({Key key}) : super(key: key);

//   @override
//   State<IdentifyColors> createState() => _IdentifyColorsState();
// }

// class _IdentifyColorsState extends State<IdentifyColors> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }

//   var child = [];

//   int acceptedData = 0;
//   int score = 0;
//   //bool gameOver = false;

//   String result() {
//     if (score == 60) {
//       //player.play('success.wav');
//       return 'Awesome..!!';
//     } else {
//       //player.play('tryAgain.wav');
//       return 'Play again to get better score';
//     }
//   }

//   // @override
//   // void restartGame() {
//   //   gameOver = false;
//   //   score = 0;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//                 'Move Birds To Correct Boxes',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
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
//           child: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             // child: Image.asset(
//             //   'assets/bg_fish.jpg',
//             //   fit: BoxFit.fill,
//             // ),
//           ),
//           Column(
//             children: [
              
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Draggable(
//                     data: 'yellow',
//                     child: Container(
//                       //color: Colors.black,
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(
//                         'assets/ghosla/yellowb.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     feedback: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           'assets/ghosla/yellowb.png',
//                           fit: BoxFit.fill,
//                         )),
//                   ),
//                   SizedBox(width: 20),
//                   Draggable(
//                     data: 'red',
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(
//                         'assets/ghosla/redb.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     feedback: Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(
//                         'assets/ghosla/redb.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Draggable(
//                     data: 'blue',
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(
//                         'assets/ghosla/blueb.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     feedback: Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset('assets/ghosla/blueb.png'),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Draggable(
//                     data: 'green',
//                     child: Container(
//                       //color: Colors.black,
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(
//                         'assets/ghosla/greenb.png',
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     feedback: Container(
//                         height: 100,
//                         width: 100,
//                         child: Image.asset(
//                           'assets/ghosla/greenb.png',
//                           fit: BoxFit.fill,
//                         )),
//                   ),
//                   Text('Score - $score')
//                 ],
//               ),
//               SizedBox(
//                 height: 55,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   DragTarget(
//                     builder: (context, candidateData, rejectedData) {
//                       return Container(
//                         height: 140,
//                         width: 180,
//                         child: Image.asset(
//                           'assets/ghosla/yellowg.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },
//                     onWillAccept: (receivedItem) {
//                 return true;
//               },
//               onAccept: (receivedItem){
//                 // if(){

//                 // }
//               }
//                   ),
//                   DragTarget(
//                     builder: (context, candidateData, rejectedData) {
//                       return Container(
//                         height: 140,
//                         width: 180,
//                         child: Image.asset(
//                           'assets/ghosla/blueg.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },
//                   ),
//                   DragTarget(
//                     builder: (context, candidateData, rejectedData) {
//                       return Container(
//                         height: 140,
//                         width: 180,
//                         child: Image.asset(
//                           'assets/ghosla/greeng.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },
//                   ),
//                   DragTarget(
//                     builder: (context, candidateData, rejectedData) {
//                       return Container(
//                         height: 140,
//                         width: 180,
//                         child: Image.asset(
//                           'assets/ghosla/redg.jpg',
//                           fit: BoxFit.fill,
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               )
//             ],
//           )
//         ],
//       )),
//     );
//   }
// }
