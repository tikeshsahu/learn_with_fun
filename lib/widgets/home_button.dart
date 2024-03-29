import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.95, -0.95),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          'assets/gui/homu.png',
          height: MediaQuery.of(context).size.height / 5.5,
          width: MediaQuery.of(context).size.width / 10,
        ),
      ),
    );
  }
}