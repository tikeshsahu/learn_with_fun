import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:need_resume/need_resume.dart';

class IdentifyProfession extends StatefulWidget {
  static const routeName = 'professions';
  const IdentifyProfession({Key key}) : super(key: key);

  @override
  State<IdentifyProfession> createState() => _IdentifyProfessionState();
}

class _IdentifyProfessionState extends ResumableState<IdentifyProfession> {
  List<Professtions> pros = [
    Professtions(
        name: 'Astronaut',
        image:
            'https://img.freepik.com/free-vector/astronaut-mars-landscape-scene_1308-31552.jpg?w=1060&t=st=1660128176~exp=1660128776~hmac=4cd2ccc596ad36f0df328920d45823f7a4fb51259d1eac2abf2e56d10fdcd262',
        //'https://assets10.lottiefiles.com/packages/lf20_ojjrkacr.json',
        pronounciation: 'Aastronaut.wav'
        //vid: 'assets/Vehicles/vids/bike.mp4'
        ),
    Professtions(
      name: 'Doctor',
      pronounciation: 'Adoctor.wav',
      image: 'https://assets8.lottiefiles.com/packages/lf20_syp9oniy.json',
      //vid: 'assets/Vehicles/vids/plane.mp4'
    ),
    Professtions(
        name: 'Farmer',
        image:
            'https://cdn.dribbble.com/users/1206528/screenshots/4270242/01.gif',
        pronounciation: 'Afarmer.wav'
        //vid: 'assets/Vehicles/vids/car.mp4'
        ),
    Professtions(
      name: 'Police Man',
      pronounciation: 'Apolice.wav',
      image:
          'https://t4.ftcdn.net/jpg/03/58/24/83/240_F_358248364_fKwsYUNOpwgw6WLvfK327mSx9yJoV9s1.jpg',
      //'https://c.tenor.com/uzez6amP_sUAAAAC/yes-yes-chingam.gif',
      //vid: 'assets/Vehicles/vids/taxi.mp4'
    ),
    Professtions(
      name: 'Fire Fighter',
      pronounciation: 'Afire.wav',
      image: 'https://terasaath.in/fireFighter.png',
      //vid: 'assets/Vehicles/vids/cycle.mp4'
    ),
    Professtions(
      name: 'Soldier',
      pronounciation: 'Asoldier.wav',
      image:
          'https://img.freepik.com/premium-vector/group-army-men-woman-camouflage-combat-uniform-saluting_180264-3.jpg?w=996',
      //'https://media.indiedb.com/images/members/5/4597/4596524/profile/Nevyn_2.gif',
      //vid: 'assets/Vehicles/vids/cycle.mp4'
    ),
    Professtions(
      name: 'Pilot',
      pronounciation: 'Apilot.wav',
      image:
          'https://img.freepik.com/premium-vector/two-pilots-background-passenger-aircraft-airport-ship-captain-co-pilot-airline-employees-vector-illustration-flat-style_165429-1136.jpg?w=1060',
      //'https://media1.giphy.com/media/U1ZahQoDpUh62880O5/giphy.gif?cid=790b761165a40e1c2f911f0b4cfb96687ba60612fd4c7dfb&rid=giphy.gif&ct=s',
      //vid: 'assets/Vehicles/vids/cycle.mp4'
    ),
    Professtions(
      name: 'Teacher',
      pronounciation: 'Ateacher.wav',
      image:
          'https://img.freepik.com/premium-vector/teacher-with-student-isolated_97632-589.jpg?w=900',
      //'https://gifimage.net/wp-content/uploads/2017/09/animated-teacher-gif-12.gif',
      //vid: 'assets/Vehicles/vids/cycle.mp4'
    ),
    Professtions(
      name: 'Scientist',
      pronounciation: 'Ascientist.wav',
      image:
          'https://i.pinimg.com/originals/9a/e0/aa/9ae0aa2ff25aa43147538ac2a9f3137f.gif',
      //vid: 'assets/Vehicles/vids/cycle.mp4'
    ),
  ];

  @override
  void initState() {
    super.initState();

    pros.shuffle();
    audioCache.play(pros[0].pronounciation);
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
                  'https://img.freepik.com/premium-vector/suburban-landscape-view-high-rise-buildings-countryside-cartoon-vector-illustration_273525-462.jpg',
                  //'https://img.freepik.com/free-vector/modern-city-town-residential-area-apartment-district-parking-lot-isometric-view-poster-with-informative-text_1284-32074.jpg?w=900&t=st=1658944002~exp=1658944602~hmac=83f742498dbdf2125b0501e74efda0440e62a7559fee74df4b3e91d0bee40c91',

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
                  height: MediaQuery.of(context).size.height / 1.26,
                  //color: Colors.amber,
                  child: CarouselSlider.builder(
                      carouselController: caro,
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.90,
                          onPageChanged: (index, reason) {
                            audioCache.play(pros[index].pronounciation);
                          },
                          autoPlayCurve: Curves.fastOutSlowIn),
                      itemCount: pros.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              height: MediaQuery.of(context).size.height / 1.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(26),
                                child: pros[index].name == 'Farmer' ||
                                        pros[index].name == 'Astronaut' ||
                                        pros[index].name == 'Fire Fighter' ||
                                        pros[index].name == 'Scientist' ||
                                        pros[index].name == 'Pilot' ||
                                        pros[index].name == 'Soldier' ||
                                        pros[index].name == 'Police Man' ||
                                        pros[index].name == 'Teacher'
                                    ? CachedNetworkImage(
                                        imageUrl: pros[index].image,
                                        fit: pros[index].name == 'Police Man'
                                            ? BoxFit.contain
                                            : BoxFit.fill,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SpinKitDualRing(
                                                    color: Colors.amberAccent),
                                        // CircularProgressIndicator(
                                        //     value: downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      )
                                    : Lottie.network(
                                        pros[index].image,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: Colors.white
                                  //Color(0xFFFFFFF0),
                                  ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 35,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 7.4,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    pros[index].name,
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
              // Align(
              //   alignment: AlignmentDirectional(0.95, -1.05),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(context, 'proGame');
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Image.asset(
              //         'assets/gui/play.png',
              //         height: 105,
              //         width: 130,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Professtions {
  final name;
  final image;
  final pronounciation;
  final vid;

  Professtions({this.name, this.image, this.pronounciation, this.vid});
}
