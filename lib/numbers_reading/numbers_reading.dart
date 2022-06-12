import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NumbersReading extends StatefulWidget {
  const NumbersReading({Key key}) : super(key: key);

  @override
  State<NumbersReading> createState() => _NumbersReadingState();
}

class _NumbersReadingState extends State<NumbersReading> {
  bool isPressed = false;
  var alphabets = [];
  @override
  void initState() {
    super.initState();
    mainn();
  }

  mainn() {
    alphabets.add(List.generate(20, (index) => "$index"));
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Colors.white;
    Offset distance = isPressed ? Offset(8, 8) : Offset(28, 28);
    double blur = isPressed ? 3.0 : 30.0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              '',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.lime),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Stack(children: [
                Container(
                  //child: Text('$alphabet'),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 125,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: alphabets.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isPressed = !isPressed),
                              child: Text(
                                alphabets[index].toString(),
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
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
                        );
                      }),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
