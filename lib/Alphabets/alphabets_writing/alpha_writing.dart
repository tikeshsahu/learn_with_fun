// import 'package:flutter/material.dart';

// class AlphabetsWriting extends StatefulWidget {
//   static const routeName = 'alphaWriting';
//   const AlphabetsWriting({Key key}) : super(key: key);

//   @override
//   State<AlphabetsWriting> createState() => _AlphabetsWritingState();
// }

// class _AlphabetsWritingState extends State<AlphabetsWriting> {
//   List<Offset> points = List<Offset>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.black,
//         child: Icon(Icons.close),
//         onPressed: () {
//           setState(() {
//             points.clear();
//           });
//         },
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//       ),
//       body: Align(
//         alignment: Alignment.center,
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 450,
//               height: 250,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.black, width: 5)),
//               child: GestureDetector(
//                 onPanUpdate: (DragUpdateDetails details) {
//                   Offset _localPosition = details.localPosition;
//                   if (_localPosition.dx >= 0 &&
//                       _localPosition.dx <= 150 &&
//                       _localPosition.dy >= 0 &&
//                       _localPosition.dy <= 150) {
//                     setState(() {
//                       points.add(_localPosition);
//                     });
//                   }
//                 },
//                 onPanEnd: (DragEndDetails details) async {
//                   points.add(null);

//                   setState(() {});
//                 },
//                 child: CustomPaint(
//                   painter: Painter(points: points),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Painter extends CustomPainter {
//   final List<Offset> points;
//   Painter({this.points});

//   final Paint _paintDetails = Paint()
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 20.0
//     ..color = Colors.teal;

//   @override
//   void paint(Canvas canvas, Size size) {
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 6] != null) {
//         canvas.drawLine(points[i], points[i + 6], _paintDetails);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(Painter oldDelegate) {
//     return true;
//   }
// }
