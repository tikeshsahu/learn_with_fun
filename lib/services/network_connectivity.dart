// showDialog() {
//     AlertDialog(
//       title: Text('Not connected'),
//       actions: [
//         ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Okay'))
//       ],
//     );
//   }

//   //Connectivity _connectivity = Connectivity();
//   //  StreamSubscription subscription;
//   // var isDeviceConnected = false;
//   // bool isAlertSet = false;
//   Timer timer;

//   bool ActiveConnection = false;
//   String T = "";
//   Future CheckUserConnection() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//         setState(() {
//           ActiveConnection = true;
//           T = "Connected";
//           print(T);
//         });
//       }
//     } on SocketException catch (_) {
//       setState(() {
//         ActiveConnection = false;
//         T = "Not connected";

//         print(T);
//       });
//       showDialog();
//     }
//   }

//   @override
//   void initState() {
//     timer = Timer.periodic(
//         Duration(seconds: 3), (Timer t) => CheckUserConnection());

//     super.initState();
//   }









// @override
  // void initState() {
  //   super.initState();
  //   getConnectivity();
  // }

  // showDialogBox() {
  //   AlertDialog(
  //     shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
  //     title: Text('Hello!!'),
  //     content: Text('Please connect to internet'),
  //     actions: [
  //       TextButton(
  //           onPressed: () async {
  //             //Navigator.pop(context, "cancel");
  //             Navigator.of(context).pop;
  //             setState(() {
  //               isAlertSet = false;
  //             });
  //             isDeviceConnected =
  //                 await InternetConnectionChecker().hasConnection;
  //             if (!isDeviceConnected) {
  //               showDialogBox();
  //               setState(() {
  //                 isAlertSet = true;
  //               });
  //             }
  //           },
  //           child: Text('Okay'))
  //     ],
  //   );
  // }

  // getConnectivity() => subscription = Connectivity()
  //         .onConnectivityChanged
  //         .listen((ConnectivityResult result) async {
  //       isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //       if (!isDeviceConnected && isAlertSet == false) {
  //         showDialogBox();
  //         setState(() {
  //           isAlertSet = true;
  //         });
  //       }
  //     });

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }