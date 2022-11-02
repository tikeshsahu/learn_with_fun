// import 'dart:math';
// import 'package:flutter/material.dart';

// class Addition extends StatefulWidget {
//   static const routeName = 'addition';
//   const Addition({Key key}) : super(key: key);

//   @override
//   State<Addition> createState() => _AdditionState();
// }

// class _AdditionState extends State<Addition> {
//   var R1 = 0, R2 = 0;
//   var random1 = 0;
//   var random2 = 0;
//   var randomObject;
//   var answer = 0;
//   var option1, option2, option3 = 0;

//   getRandoms() {
//     randomObject = new Random();
//     random1 = 1 + randomObject.nextInt(6 - 1);
//     random2 = 1 + randomObject.nextInt(6 - 1);
//     R1 = random1;
//     R2 = random2;
//     answer = R1 + R2;
//     print(R1);
//     print(R2);
//     print(answer);
//   }

//   getOptions(int answer) {
//     List<int> newList = [];
//     List<int> list = List.generate(7, (i) => i + 1);
//     list.shuffle();
//     newList = list.take(2).toList();

//     newList.add(answer);
//     newList.shuffle();
//     print(newList);
//     return newList;
//   }

//   options() {
//     var options = getOptions(answer);
//     option1 = options[0];
//     option2 = options[1];
//     option3 = options[2];
//     print(option1);
//     print(option2);
//     print(option3);
//   }

//   @override
//   void initState() {
//     super.initState();
//     getRandoms();
//     options();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 'assets/bggggg.jpg',
//                 fit: BoxFit.fill,
//               )),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [HangingBoard(), HangingBoard(), HangingBoard()],
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               AnimationControllerr(),
//             ],
//           ),
//           Positioned(
//               bottom: 70,
//               left: 290,
//               child: Text(
//                 R1.toString(),
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               bottom: 70,
//               right: 290,
//               child: Text(
//                 R2.toString(),
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               bottom: 75,
//               left: 385,
//               child: Text(
//                 '+',
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               bottom: 70,
//               right: 120,
//               child: Text(
//                 '?',
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               top: 100,
//               left: 120,
//               child: Text(
//                 option1.toString(),
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               top: 100,
//               left: 385,
//               child: Text(
//                 option2.toString(),
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//               top: 100,
//               right: 120,
//               child: Text(
//                 option3.toString(),
//                 style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
//               )),
//         ],
//       ),
//     );
//   }
// }

// class AnimationControllerr extends StatefulWidget {
//   const AnimationControllerr({Key key}) : super(key: key);

//   @override
//   State<AnimationControllerr> createState() => _AnimationControllerrState();
// }

// class _AnimationControllerrState extends State<AnimationControllerr>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation _animation;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _controller =
//         AnimationController(duration: Duration(seconds: 2), vsync: this)
//           ..forward();

//     _animation =
//         Tween(begin: Offset(0.95, 0), end: Offset.zero).animate(_controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       child: Container(
//         color: Colors.amber,
//         width: 755,
//         height: 180,
//         child: Image.asset(
//           'assets/maths_train.jpeg',
//           //width: MediaQuery.of(context).size.width,
//           fit: BoxFit.fill,
//         ),
//       ),
//       position: _animation,
//     );
//   }
// }

// class HangingBoard extends StatefulWidget {
//   const HangingBoard({Key key}) : super(key: key);

//   @override
//   State<HangingBoard> createState() => _HangingBoardState();
// }

// class _HangingBoardState extends State<HangingBoard>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         duration: Duration(seconds: 1.5.toInt()), vsync: this)
//       ..forward();

//     _animation =
//         Tween(begin: Offset(0.95, 0), end: Offset.zero).animate(_controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _animation,
//       child: Image.asset(
//         'assets/hanging_board.jpg',
//         height: 200,
//         width: 200,
//       ),
//     );
//   }
// }
