// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AnimalPuzzle extends StatefulWidget {
//   static const routeName = 'puzzle';
//   const AnimalPuzzle({Key key}) : super(key: key);

//   @override
//   State<AnimalPuzzle> createState() => _AnimalPuzzleState();
// }

// class _AnimalPuzzleState extends State<AnimalPuzzle> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     data();
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }

//   List<PuzzleModel> Heads = [];
//   List<PuzzleModel> Tails = [];
//   List<PuzzleModel> Tails1 = [];
//   data() {
//     Heads = [
//       PuzzleModel(
//         image: 'assets/puzzle/heads/elephant1.png',
//         value: 0,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/heads/hen1.png',
//         value: 1,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/heads/horse1.png',
//         value: 2,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/heads/lion1.png',
//         value: 3,
//       ),
//     ].toList();

//     Tails = [
//       PuzzleModel(
//         image: 'assets/puzzle/tails/elephant2.png',
//         value: 0,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/hen2.png',
//         value: 1,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/horse2.png',
//         value: 2,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/lion2.png',
//         value: 3,
//       ),
//     ].toList();
//     Heads.shuffle();
//     Tails.shuffle();
//     Tails1 = [
//       PuzzleModel(
//         image: 'assets/puzzle/tails/elephant2.png',
//         value: 0,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/hen2.png',
//         value: 1,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/horse2.png',
//         value: 2,
//       ),
//       PuzzleModel(
//         image: 'assets/puzzle/tails/lion2.png',
//         value: 3,
//       ),
//     ].toList();
//   }

//   bool isCorrect = false;
//   int testItem = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//       body: Row(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                   color: Colors.amber,
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width / 5.2,
//                   child: ListView.separated(
//                       itemCount: 4,
//                       separatorBuilder: (BuildContext context, int index) =>
//                           const Divider(
//                             height: 8,
//                           ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Center(
//                           child: Container(
//                             height: 84,
//                             width: 110,
//                             color: Colors.cyan,
//                             child: Image.asset(
//                               'assets/puzzle/full/cow.png',
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         );
//                       })),
//             ],
//           ),
//           SizedBox(
//             width: 17,
//           ),
//           Container(
//             height: 205,
//             width: 205,
//             color: Colors.amber,
//             child: Image.asset(
//               Heads[0].image,
//               fit: BoxFit.fill,
//             ),
//           ),
//           SizedBox(
//             width: 3,
//           ),
//           DragTarget(
//               builder: (context, acceptedItems, rejectedItems) => isCorrect
//                   ? Image.asset(
//                       Tails1[testItem].image,
//                       height: 205,
//                       width: 205,
//                     )
//                   : Container(
//                       height: 205,
//                       width: 205,
//                       color: Color.fromARGB(255, 54, 51, 41),
//                     ),
//               onWillAccept: (receivedItem) {
//                 //print(receivedItem);

//                 return true;
//               },
//               onAccept: (receivedItem) {
//                 //print(receivedItem);
//                 if (Heads[0].value == receivedItem) {
//                   isCorrect = true;
//                   print("sahi hai yhi hai tail");
//                  testItem = receivedItem;
//                   setState(() {
//                     Heads.removeAt(0);
//                     Tails.removeAt(receivedItem);
//                     Tails1.remove(receivedItem  );
//                     isCorrect = false;
//                   });
                   

//                 }
//               }),
//           SizedBox(
//             width: 17,
//           ),
//           Container(
//               color: Colors.amber,
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width / 4.8,
//               child: ListView.separated(
//                   itemCount: Heads.length,
//                   separatorBuilder: (BuildContext context, int index) =>
//                       const Divider(
//                         height: 8,
//                       ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Center(
//                       child: Draggable(
//                         data: Tails[index].value,
//                         child: Container(
//                           height: 84,
//                           width: 135,
//                           color: Colors.cyan,
//                           child: Image.asset(
//                             Tails[index].image,
//                           ),
//                         ),
//                         feedback: Container(
//                           height: 84,
//                           width: 110,
//                           color: Colors.cyan,
//                           child: Image.asset(
//                             Tails[index].image,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     );
//                   })),
//         ],
//       ),
//     );
//   }
// }

// class PuzzleModel {
//   final String image;
//   final int value;

//   PuzzleModel({this.image, this.value});
// }
