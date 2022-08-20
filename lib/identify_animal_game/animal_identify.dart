// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// class IdentifyAnimal extends StatefulWidget {
//   static const routeName = 'identify';
//   const IdentifyAnimal({Key key}) : super(key: key);

//   @override
//   State<IdentifyAnimal> createState() => _IdentifyAnimalState();
// }

// class _IdentifyAnimalState extends State<IdentifyAnimal> {
//   void initState() {
//     super.initState();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     controller = VideoPlayerController.asset('assets/Vehicles/vids/train.mp4')
//     ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   dispose() {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }

//   VideoPlayerController controller;
//   // : Stack(children: [
//         //     Container(
//         //       height: MediaQuery.of(context).size.height,
//         //       width: MediaQuery.of(context).size.width,
//         //       child: Image.asset('assets/bgImage_identifyAnimal.png',
//         //           fit: BoxFit.fill),
//         //     ),
//         //   ])

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: controller.value.aspectRatio,
//                     child: VideoPlayer(controller),
//                   )
//                 : Container(),
//           ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               controller.value.isPlaying
//                   ? controller.pause()
//                   : controller.play();
//             });
//           },
//           child: Icon(
//             controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//         );
//   }

//   @override
//   void disposeV() {
//     super.dispose();
//     controller.dispose();
//   }
// }
