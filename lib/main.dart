import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learn_with_fun/pages/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'games/Alphabets/alphabet_reading.dart';
import 'games/Identify/identify_profession.dart';
import 'games/Identify/identify_vehicles.dart';
import 'games/Identify/vehicle_game.dart';
import 'games/match_the_animals/animals.dart';
import 'games/match_the_animals/animal_match_game.dart';
import 'games/match_the_fruits/fruits.dart';
import 'games/match_the_fruits/fruits_match_game.dart';
import 'games/numbers_reading/numbers_reading.dart';
import 'pages/home.dart';
import 'package:vector_math/vector_math.dart' as math;

void main() {
// async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  showDialog() {
    AlertDialog(
      title: Text('Not connected'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Okay'))
      ],
    );
  }

  //Connectivity _connectivity = Connectivity();
  //  StreamSubscription subscription;
  // var isDeviceConnected = false;
  // bool isAlertSet = false;
  Timer timer;

  bool ActiveConnection = false;
  String T = "";
  Future CheckUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ActiveConnection = true;
          T = "Connected";
          print(T);
        });
      }
    } on SocketException catch (_) {
      setState(() {
        ActiveConnection = false;
        T = "Not connected";

        print(T);
      });
      showDialog();
    }
  }

  @override
  void initState() {
    timer = Timer.periodic(
        Duration(seconds: 3), (Timer t) => CheckUserConnection());

    super.initState();
  }
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

  @override
  Widget build(BuildContext context) => OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {
            Home.routeName: (ctx) => const Home(),
            Animals.routeName: (ctx) => const Animals(),
            Fruits.routeName: (ctx) => const Fruits(),
            AlphabetsLearning.routeName: (ctx) => const AlphabetsLearning(),
            IdentifyVehicles.routeName: (ctx) => const IdentifyVehicles(),
            IdentifyProfession.routeName: (ctx) => const IdentifyProfession(),
            VehicleGame.routeName: (ctx) => const VehicleGame(),
            MatchGame.routeName: (ctx) => const MatchGame(),
            FruitsMatchGame.routeName: (ctx) => const FruitsMatchGame(),
            NumbersReading.routeName: (ctx) => const NumbersReading(),
            StartPage.routeName: (ctx) => const StartPage(),
            // AlphabetsWriting.routeName: (ctx) => AlphabetsWriting(),
            // AnimalPuzzle.routeName: (ctx) => AnimalPuzzle(),
            // CountingGame.routeName: (ctx) => CountingGame(),
            // FindTheMissing.routeName: (ctx) => FindTheMissing(),
            // ProGame.routeName: (ctx) => ProGame(),
            // IdentifyColors.routeName: (ctx) => IdentifyColors(),
            // IdentifyAnimal.routeName: (ctx) => IdentifyAnimal(),
            // Addition.routeName: (ctx) => Addition(),
          },
        ),
      );
}
