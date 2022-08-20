import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class IdentifyVehicles extends StatefulWidget {
  static const routeName = 'vehicles';
  const IdentifyVehicles({Key key}) : super(key: key);

  @override
  State<IdentifyVehicles> createState() => _IdentifyVehiclesState();
}

class _IdentifyVehiclesState extends ResumableState<IdentifyVehicles> {
  List<Vehicles> gaddi = [
    Vehicles(
      name: 'Aeroplane',
      audio: 'aeroplane.wav',
      image: 'https://assets7.lottiefiles.com/packages/lf20_fyffhdtn.json',
    ),
    Vehicles(
      name: 'Ambulance',
      audio: 'ambulance.wav',
      image: 'https://assets7.lottiefiles.com/packages/lf20_sy2feyup.json',
    ),
    Vehicles(
      name: 'Bicycle',
      audio: 'bicycle.wav',
      image: 'https://assets3.lottiefiles.com/packages/lf20_ht8zw3es.json',
    ),
    Vehicles(
      name: 'Bike',
      audio: 'bike.wav',
      image:
      'https://terasaath.in/vehBike.png',
          //'https://img.freepik.com/free-vector/flat-red-sport-bike-concept_1284-36218.jpg?t=st=1657693499~exp=1657694099~hmac=dd52fe4a8cd37a99b727cf15391046b341e0fa87e63b2e32ccbadafab3957901&w=740',
    ),
    Vehicles(
      name: 'Car',
      audio: 'car.wav',
      image: 'https://assets2.lottiefiles.com/packages/lf20_swnrn2oy.json',
    ),
    Vehicles(
      name: 'Fire Truck',
      audio: 'firetruck.wav',
      image:
      'https://terasaath.in/vehFire.png',
          //' https://pngset.com/images/cartoon-firefighter-pictures-cartoon-fire-truck-and-fire-brigade-clipart-vehicle-transportation-person-human-transparent-png-2715986.png',
    ),
    Vehicles(
      name: 'Helicopter',
      audio: 'helicopter.wav',
      image: 'https://c.tenor.com/Ef1jtR7xalIAAAAi/helicopter-joypixels.gif',
    ),
    Vehicles(
      name: 'Ship',
      audio: 'ship.wav',
      image: 'https://assets7.lottiefiles.com/packages/lf20_0fytsweq.json',
    ),
    Vehicles(
      name: 'Tractor',
      audio: 'tractor.wav',
      image: 'https://assets2.lottiefiles.com/packages/lf20_qnA9I4.json',
    ),
    Vehicles(
      name: 'Scooter',
      audio: 'scooter.wav',
      image: 'https://assets4.lottiefiles.com/packages/lf20_gxhmijxe.json',
    ),
    Vehicles(
      name: 'Truck',
      audio: 'truck.wav',
      image:
      'https://terasaath.in/vehTruck.png',
          //'https://img.freepik.com/free-vector/blue-orange-truck-isolated_1308-27814.jpg?w=1380&t=st=1659544653~exp=1659545253~hmac=5b53f62ef1a26868554900d21e66fda1c9523602584d475432a68f02b275c6e1',
      
    ),
    Vehicles(
      name: 'Bus',
      audio: 'bus.wav',
      image:
      'https://terasaath.in/proBus.png'
          //'https://img.freepik.com/premium-vector/cartoon-school-bus-with-children-back-school-concept_152098-378.jpg?w=826',
    
    ),
  ];

  @override
  void initState() {
    super.initState();
    gaddi.shuffle();
    audioCache.play(gaddi[0].audio);
  }

  @override
  dispose() {
    super.dispose();
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  'https://img.freepik.com/free-vector/street-side-scene-with-red-telephone-box-scene_1308-45338.jpg?w=1060&t=st=1659095260~exp=1659095860~hmac=cbedfed98ff98b26fcf70f2f180a140310ad8181f1251d17ed5b17da8fa717ac',
                  //'https://img.freepik.com/free-vector/cartoon-empty-underground-car-parking-indoor-interior-garage-city-shopping-mall-basement-with-marking-road-automobile-park-places-columns-sign-exit-guiding-arrows-concrete-floor_88138-809.jpg?w=1060&t=st=1659092730~exp=1659093330~hmac=736ca94b249a853697fb1623b72a5f51598d67dd153e771e6b84df3d0eb5651d',
                  //'assets/Vehicles/vehiclebg.png',
    
                  fit: BoxFit.fill,
                ),
              ),
              Align(
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
              ),
              Align(
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
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
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
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                                  SpinKitDualRing(
                                                      color: Colors.amberAccent),
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
                                      fontSize: MediaQuery.of(context).size.height /
                                              10.5,
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
              ),
              Align(
                alignment: AlignmentDirectional(-0.95, 0.2),
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
              ),
              Align(
                alignment: AlignmentDirectional(0.95, 0.2),
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
              ),
              Align(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Vehicles {
  final name;
  final image;
  final audio;
  final vid;

  Vehicles({this.name, this.image, this.audio, this.vid});
}
