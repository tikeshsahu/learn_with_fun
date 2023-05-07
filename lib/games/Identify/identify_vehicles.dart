import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learn_with_fun/class/vehicle_class.dart';
import 'package:learn_with_fun/widgets/sliderLeftButton.dart';
import 'package:learn_with_fun/widgets/sliderRightButton.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class IdentifyVehicles extends StatefulWidget {
  static const routeName = 'vehicles';
  const IdentifyVehicles({Key key}) : super(key: key);

  @override
  State<IdentifyVehicles> createState() => _IdentifyVehiclesState();
}

class _IdentifyVehiclesState extends ResumableState<IdentifyVehicles> {
  @override
  void initState() {
    super.initState();
    gaddi.shuffle();
    audioCache.play(gaddi[0].audio);
  }

  void onReady() {
    // Implement your code inside here
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void onResume() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<Vehicles> gaddi = Vehicles.gaddi;
  CarouselController caro = CarouselController();
  AudioCache audioCache = AudioCache();
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              backGroundImage(context),
              homeButton(context),
              slider(context),
              SliderLeftButton(caro: caro),
              SliderRightButton(caro: caro),
              playButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Align slider(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.12, 1),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 1.44,
        //color: Colors.amber,
        child: CarouselSlider.builder(
            carouselController: caro,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 0.90,
                onPageChanged: (index, reason) {
                  audioCache.play(gaddi[index].audio);
                },
                autoPlayCurve: Curves.fastOutSlowIn),
            itemCount: gaddi.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width / 1.9,
                    child: GestureDetector(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: gaddi[index].name == 'Truck' ||
                                gaddi[index].name == 'Bus' ||
                                gaddi[index].name == 'Bike' ||
                                gaddi[index].name == 'Helicopter' ||
                                gaddi[index].name == 'Fire Truck'
                            ? CachedNetworkImage(
                                fit: gaddi[index].name == 'Bike'
                                    ? BoxFit.contain
                                    : BoxFit.fill,
                                imageUrl: gaddi[index].image,
                                progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                    SpinKitDualRing(color: Colors.amberAccent),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              )
                            : Lottie.network(gaddi[index].image,
                                fit: gaddi[index].name == 'Cat'
                                    ? BoxFit.contain
                                    : BoxFit.fill),
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
                          gaddi[index].name,
                          style: TextStyle(
                            fontFamily: 'party',
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 10.5,
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

  Align homeButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-0.95, -0.95),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/homu.png',
            height: MediaQuery.of(context).size.height / 5.5,
            width: MediaQuery.of(context).size.width / 10,
          ),
        ),
      ),
    );
  }

  SizedBox backGroundImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CachedNetworkImage(
        imageUrl:
            'https://img.freepik.com/free-vector/street-side-scene-with-red-telephone-box-scene_1308-45338.jpg?w=1060&t=st=1659095260~exp=1659095860~hmac=cbedfed98ff98b26fcf70f2f180a140310ad8181f1251d17ed5b17da8fa717ac',
        //'https://img.freepik.com/free-vector/cartoon-empty-underground-car-parking-indoor-interior-garage-city-shopping-mall-basement-with-marking-road-automobile-park-places-columns-sign-exit-guiding-arrows-concrete-floor_88138-809.jpg?w=1060&t=st=1659092730~exp=1659093330~hmac=736ca94b249a853697fb1623b72a5f51598d67dd153e771e6b84df3d0eb5651d',
        //'assets/Vehicles/vehiclebg.png',

        fit: BoxFit.fill,
      ),
    );
  }

  Align playButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.95, -1.05),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'vehicleGame');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/gui/play.png',
            height: 105,
            width: 130,
          ),
        ),
      ),
    );
  }
}
