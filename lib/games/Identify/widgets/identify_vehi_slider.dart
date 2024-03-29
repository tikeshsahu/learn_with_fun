import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/vehicle_class.dart';
import 'package:lottie/lottie.dart';

class IdentifyVehicleSlider extends StatefulWidget {
  final CarouselController caro;
  final AudioPlayer player;
  final List<Vehicles> gaddi;
  const IdentifyVehicleSlider({Key? key, required this.caro, required this.player, required this.gaddi}) : super(key: key);

  @override
  State<IdentifyVehicleSlider> createState() => _IdentifyVehicleSliderState();
}

class _IdentifyVehicleSliderState extends State<IdentifyVehicleSlider> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-0.12, 1),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.44,
        child: CarouselSlider.builder(
            carouselController: widget.caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  widget.player.play(AssetSource(widget.gaddi[index].audio));
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: widget.gaddi.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: widget.gaddi[index].name == 'Truck' || widget.gaddi[index].name == 'Bus' || widget.gaddi[index].name == 'Bike' || widget.gaddi[index].name == 'Helicopter' || widget.gaddi[index].name == 'Fire Truck'
                            ? CachedNetworkImage(
                                fit: widget.gaddi[index].name == 'Bike' ? BoxFit.contain : BoxFit.fill,
                                imageUrl: widget.gaddi[index].image,
                                progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              )
                            : Lottie.network(widget.gaddi[index].image, fit: widget.gaddi[index].name == 'Cat' ? BoxFit.contain : BoxFit.fill),
                      ),
                    ),
                    decoration: BoxDecoration(
                      //color: Color(0xFFFFFFF0),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 7.2,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.gaddi[index].name,
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
