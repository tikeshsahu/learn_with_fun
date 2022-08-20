import 'package:flutter/material.dart';
import 'package:learning_game/Alphabets/alphabets_reading/alphabets_reading.dart';
import 'package:learning_game/Identify/identify_vehicles.dart';
import 'package:learning_game/Identify/profession_game.dart';
import 'package:learning_game/Identify/vehicle_game.dart';
import 'package:learning_game/home.dart';
import 'package:learning_game/match_the_animals/animals.dart';
import 'package:learning_game/match_the_animals/match_game.dart';
import 'package:learning_game/match_the_fruits/fruits.dart';
import 'package:learning_game/match_the_fruits/fruits_match_game.dart';
import 'package:learning_game/numbers_reading/numbers_reading.dart';
import 'package:learning_game/pages/start_page.dart';
import 'package:learning_game/trial.dart';
import 'Identify/identify_profession.dart';

void main() {
// async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          Home.routeName: (ctx) => Home(),
          Animals.routeName: (ctx) => Animals(),
          Fruits.routeName: (ctx) => Fruits(),
          AlphabetsLearning.routeName: (ctx) => AlphabetsLearning(),
          // AlphabetsWriting.routeName: (ctx) => AlphabetsWriting(),
          // AnimalPuzzle.routeName: (ctx) => AnimalPuzzle(),
          // CountingGame.routeName: (ctx) => CountingGame(),
          // FindTheMissing.routeName: (ctx) => FindTheMissing(),
          IdentifyVehicles.routeName: (ctx) => const IdentifyVehicles(),
          IdentifyProfession.routeName: (ctx) => IdentifyProfession(),
          //ProGame.routeName: (ctx) => ProGame(),
          VehicleGame.routeName: (ctx) => VehicleGame(),
          MatchGame.routeName: (ctx) => MatchGame(),
          FruitsMatchGame.routeName: (ctx) => FruitsMatchGame(),
          // IdentifyColors.routeName: (ctx) => IdentifyColors(),
          // IdentifyAnimal.routeName: (ctx) => IdentifyAnimal(),
          // Addition.routeName: (ctx) => Addition(),
          NumbersReading.routeName: (ctx) => NumbersReading(),
          StartPage.routeName: (ctx) => StartPage(),
          PuzzleWidget.routeName: (ctx) => PuzzleWidget(),
        },
      );
}
