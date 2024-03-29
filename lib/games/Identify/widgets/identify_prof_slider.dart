import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/profession_class.dart';
import 'package:lottie/lottie.dart';

class IdentifyProfessionSlider extends StatefulWidget {
  final CarouselController caro;
  final AudioPlayer player;
  final List<Professtions> pros;
  const IdentifyProfessionSlider({Key? key, required this.caro, required this.player, required this.pros}) : super(key: key);

  @override
  State<IdentifyProfessionSlider> createState() => _IdentifyProfessionSliderState();
}

class _IdentifyProfessionSliderState extends State<IdentifyProfessionSlider> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: const AlignmentDirectional(-0.12, 1),
      child: SizedBox(
        width: size.width / 1.5,
        height: size.height / 1.26,
        child: CarouselSlider.builder(
            carouselController: widget.caro,
            options: CarouselOptions(
                height: size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  widget.player.play(AssetSource(widget.pros[index].pronounciation));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: widget.pros.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  Container(
                    width: size.width / 1.8,
                    height: size.height / 1.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: widget.pros[index].name == 'Farmer' || widget.pros[index].name == 'Astronaut' || widget.pros[index].name == 'Fire Fighter' || widget.pros[index].name == 'Scientist' || widget.pros[index].name == 'Pilot' || widget.pros[index].name == 'Soldier' || widget.pros[index].name == 'Police Man' || widget.pros[index].name == 'Teacher'
                          ? CachedNetworkImage(
                              imageUrl: widget.pros[index].image,
                              fit: widget.pros[index].name == 'Police Man' ? BoxFit.contain : BoxFit.fill,
                              progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                              // CircularProgressIndicator(
                              //     value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                          : Lottie.network(
                              widget.pros[index].image,
                              fit: BoxFit.fill,
                            ),
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(26), color: Colors.white
                        //Color(0xFFFFFFF0),
                        ),
                  ),
                  SizedBox(
                    height: size.height / 35,
                  ),
                  Container(
                    height: size.height / 7.4,
                    width: size.width / 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.pros[index].name,
                          style: TextStyle(
                            fontFamily: 'party',
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: size.height / 11.5,
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
