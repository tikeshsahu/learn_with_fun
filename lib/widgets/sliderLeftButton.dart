import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class SliderLeftButton extends StatelessWidget {
  final CarouselController caro;

  const SliderLeftButton({Key key, this.caro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.95, 0),
      child: InkWell(
        onTap: () {
          caro.previousPage();
        },
        child: Image.asset(
          'assets/gui/left.png',
          height: MediaQuery.of(context).size.height / 5.2,
          width: MediaQuery.of(context).size.width / 9.6,
        ),
      ),
    );
  }
}
