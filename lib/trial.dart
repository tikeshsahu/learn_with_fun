import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'Alphabets/alphabets_reading/class.dart';
import 'match_the_animals/itemModel.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<ItemModel> items = [];

  var spacecrafts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 65; i <= 90; i++) {
      items.add(
        ItemModel(
            name: String.fromCharCode(i).toUpperCase(),
            image: "",
            value: "",
            accepting: true,
            music: ""),
      );
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    final backgroundColor = Colors.white;
    Offset distance = isPressed ? Offset(8, 8) : Offset(28, 28);
    double blur = isPressed ? 3.0 : 30.0;

    var myGridView = GridView.builder(
      itemCount: items.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                child: Text(
                  //alphabets[index].getAlphabet,
                  //spacecrafts[index],
                  items[index].name,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: blur,
                          offset: -distance,
                          color: Color.fromARGB(255, 249, 247, 247),
                          inset: isPressed),
                      BoxShadow(
                          blurRadius: blur,
                          offset: distance,
                          color: Color.fromARGB(255, 147, 140, 140),
                          inset: isPressed)
                    ]),
              ),
            ),
            onTap: () {
              print(spacecrafts[index]);
            });
      },
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text("Flutter GridView")),
      body: myGridView,
    );
  }
}
