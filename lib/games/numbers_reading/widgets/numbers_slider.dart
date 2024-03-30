import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/numbers_class.dart';

class NumbersReadingSlider extends StatefulWidget {
  final CarouselController caro;
  final AudioPlayer player;
  final List<NumbersLearn> numbers;

  const NumbersReadingSlider({Key? key, required this.caro, required this.player, required this.numbers}) : super(key: key);


  @override
  State<NumbersReadingSlider> createState() => _NumbersReadingSliderState();
}

class _NumbersReadingSliderState extends State<NumbersReadingSlider> {
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, -0.20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.35,
        height: MediaQuery.of(context).size.height / 1.3,
        child: CarouselSlider.builder(
            carouselController: widget.caro,
            options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  widget.player.play(AssetSource(widget.numbers[index].pronounciation));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: widget.numbers.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return GestureDetector(
                onTap: () {
                  widget.player.play(AssetSource(widget.numbers[index].pronounciation));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 2.3,
                        width: MediaQuery.of(context).size.width / 4.5,
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            widget.numbers[index].num,
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(
                                fontSize: 130,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Freshman'),
                          ),
                        )),
                    const Text(
                      '-',
                      style: TextStyle(
                          fontFamily: 'Chicle',
                          fontSize: 35,
                          color: Colors.black87),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: CachedNetworkImage(
                          imageUrl: widget.numbers[index].dialogImage,
                          progressIndicatorBuilder: (context, url,
                                  downloadProgress) =>
                              const SpinKitDualRing(color: Colors.amberAccent),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}