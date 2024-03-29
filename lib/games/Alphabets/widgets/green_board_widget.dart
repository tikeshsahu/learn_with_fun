import 'package:flutter/material.dart';

class GreenBoardWidget extends StatelessWidget {
  const GreenBoardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.00),
      child: Image.asset(
        'assets/Alphabets/bb.png',
        height: MediaQuery.of(context).size.height / 1.01,
        width: MediaQuery.of(context).size.width / 1.15,
        fit: BoxFit.fill,
      ),
    );
  }
}