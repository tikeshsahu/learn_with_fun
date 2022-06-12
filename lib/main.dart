import 'package:flutter/material.dart';
import 'package:learning_game/homepage.dart';
import 'package:learning_game/pages/start_page.dart';



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
  Widget build(BuildContext context) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
      //StartPage()
      );
}

