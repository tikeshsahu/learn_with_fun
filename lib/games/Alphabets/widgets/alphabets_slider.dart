import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn_with_fun/class/alphabet_class.dart';
import 'package:lottie/lottie.dart';

class AlphabetSlider extends StatefulWidget {
  final CarouselController caro;
  final AudioPlayer player;
  const AlphabetSlider({Key? key, required this.caro, required this.player}) : super(key: key);

  @override
  State<AlphabetSlider> createState() => _AlphabetSliderState();
}

class _AlphabetSliderState extends State<AlphabetSlider> {
  List<AlphabetsReadingModel> alphabets = AlphabetsReadingModel.alphabets;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: const AlignmentDirectional(0.00, -0.24),
      child: SizedBox(
        width: size.width / 1.45,
        //color: Colors.black38,
        child: CarouselSlider.builder(
            carouselController: widget.caro,
            options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  widget.player.play(AssetSource(alphabets[index].pronounciation));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: alphabets.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    width: 140,
                    //color: Colors.amber,
                    child: GestureDetector(
                      child: Image.asset(
                        alphabets[index].image,
                        fit: alphabets[index].title == 'W' || alphabets[index].description == 'I' ? BoxFit.contain : BoxFit.cover,
                      ),
                      onTap: () {
                        // setState(() {
                        //   alphabets[index].itemIsPressed =
                        //       !alphabets[index].itemIsPressed;
                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width / 28,
                  ),
                  const Text(
                    'For',
                    style: TextStyle(fontFamily: 'Chicle', fontSize: 35, color: Colors.white),
                  ),
                  SizedBox(
                    width: size.width / 24,
                  ),
                  Container(
                    height: size.height / 1.7,
                    width: size.width / 3.2,
                    child: alphabets[index].description == 'Z  for  Zebra'
                        ? CachedNetworkImage(
                            imageUrl: alphabets[index].forImage,
                            fit: BoxFit.fill,
                          )
                        : Lottie.network(
                            alphabets[index].forImage,
                            fit: BoxFit.fill,
                            errorBuilder: (context, url, error) => const Icon(
                              Icons.error,
                              size: 30,
                            ),
                          ),
                    decoration: BoxDecoration(
                      //color: Color(0xFFFFFFF0),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}