import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_with_fun/dependency_injection.dart';
import 'package:learn_with_fun/screens/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'games/Alphabets/alphabet_reading.dart';
import 'games/Identify/identify_profession.dart';
import 'games/Identify/identify_vehicles.dart';
import 'games/Identify/vehicle_game.dart';
import 'games/match_the_animals/animals.dart';
import 'games/match_the_animals/animal_match_game.dart';
import 'games/match_the_fruits/fruits.dart';
import 'games/match_the_fruits/fruits_match_game.dart';
import 'games/numbers_reading/numbers_reading.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  DependencyInjection.init();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => OverlaySupport.global(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {
            Home.routename: (ctx) => const Home(),
            Animals.routeName: (ctx) => const Animals(),
            Fruits.routeName: (ctx) => const Fruits(),
            AlphabetsLearning.routeName: (ctx) => const AlphabetsLearning(),
            IdentifyVehicles.routeName: (ctx) => const IdentifyVehicles(),
            IdentifyProfession.routeName: (ctx) => const IdentifyProfession(),
            VehicleGame.routeName: (ctx) => const VehicleGame(),
            MatchGame.routeName: (ctx) => const MatchGame(),
            FruitsMatchGame.routeName: (ctx) => const FruitsMatchGame(),
            NumbersReading.routeName: (ctx) => const NumbersReading(),
            // StartPage.routeName: (ctx) => const StartPage(),
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
