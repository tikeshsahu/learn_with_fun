import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/itemModel.dart';
import 'package:lottie/lottie.dart';

class FruitsSlider extends StatefulWidget {
  final CarouselController caro;
  final AudioPlayer player;
  final List<MatchGameModel> items;
  
  const FruitsSlider({Key? key,required this.caro,required this.player, required this.items}) : super(key: key);

  @override
  State<FruitsSlider> createState() => _FruitsSliderState();
}

class _FruitsSliderState extends State<FruitsSlider> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0.80),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.49,
        height: MediaQuery.of(context).size.height / 1.395,
        child: CarouselSlider.builder(
            carouselController: widget.caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  widget.player.play(AssetSource(widget.items[index].audio!));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.02,
                    width: MediaQuery.of(context).size.width / 2,
                    child: GestureDetector(
                      child: ClipRRect(
                        child: widget.items[index].name == 'Apple' || widget.items[index].name == 'Grapes' || widget.items[index].name == 'Strawberry' || widget.items[index].name == 'Cherry'
                            // || items[index].name == 'Watermelon'
                            // || items[index].name == 'Orange'
                            ? CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: widget.items[index].image,
                                progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              )
                            : Lottie.network(widget.items[index].image, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7.5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.items[index].name,
                          style: TextStyle(
                            fontFamily: 'party',
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 11.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(26),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}