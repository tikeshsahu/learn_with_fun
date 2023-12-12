import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class SliderRightButton extends StatelessWidget {
  final CarouselController caro;

  const SliderRightButton({Key? key, required this.caro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.95, 0),
      child: InkWell(
        onTap: () {
          caro.nextPage();
        },
        child: Image.asset(
          'assets/gui/right.png',
          height: MediaQuery.of(context).size.height / 5.2,
          width: MediaQuery.of(context).size.width / 9.6,
        ),
      ),
    );
  }
}
