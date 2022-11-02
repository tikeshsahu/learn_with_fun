import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide  BoxShadow;
//import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class NumbersReading extends StatefulWidget {
  static const routeName = 'numbersreading';
  const NumbersReading({Key key}) : super(key: key);

  @override
  State<NumbersReading> createState() => _NumbersReadingState();
}

class _NumbersReadingState extends State<NumbersReading> {
  //List numbList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
    audioCache.play(numbers[0].pronounciation);
  }

  AudioCache audioCache = AudioCache();
  CarouselController caro = CarouselController();

  List<NumbersLearn> numbers = [
    NumbersLearn(
        num: '1',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-542.jpg?w=826',
        pronounciation: '1.wav',
        ),
    NumbersLearn(
      num: '2',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-543.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '2.wav',
        ),
    NumbersLearn(
      num: '3',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-544.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '3.wav',
        ),
    NumbersLearn(
      num: '4',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-545.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '4.wav',
        ),
    NumbersLearn(
      num: '5',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-546.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '5.wav',
        ),
    NumbersLearn(
      num: '6',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-547.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '6.wav',
        ),
    NumbersLearn(
      num: '7',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-548.jpg?size=626&ext=jpg&uid=R73775615&ga=GA1.2.971443736.1653827832',
        pronounciation: '7.wav',
        ),
    NumbersLearn(
      num: '8',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-549.jpg?size=626&ext=jpg&ga=GA1.2.971443736.1653827832',
        pronounciation: '8.wav',
        ),
    NumbersLearn(
      num: '9',
        dialogImage:
            'https://img.freepik.com/premium-vector/cute-kid-counting-numbers-by-showing-number-board-isolated_330389-550.jpg?size=626&ext=jpg&ga=GA1.2.971443736.1653827832',
        pronounciation: '9.wav',
        ),
    NumbersLearn(
      num: '10',
        dialogImage:
            'https://img.freepik.com/premium-vector/happy-children-hand-showing-number-ten-cute-kids-showing-numbers-by-fingers-little-child-study-math-number-count-fruit-education-concept-learning-material-isolated-illustration_83111-958.jpg?w=740',
        pronounciation: '10.wav',
        ),
  ];

  Future<bool> _onWillPop() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          body: SafeArea(
              child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl:'https://img.freepik.com/premium-vector/colorful-playful-numbers-background-perfect-educational-presentation-background-kids_91515-252.jpg?w=1060',
            //'https://png.pngtree.com/thumb_back/fw800/back_pic/03/87/56/9757d25d61d31ad.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: AlignmentDirectional(-0.95, -0.95),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, 'home');
              },
              child: Image.asset(
                'assets/gui/homeButton.png',
                height: MediaQuery.of(context).size.height / 5.5,
                width: MediaQuery.of(context).size.width / 10,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.95, 0),
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
            alignment: AlignmentDirectional(0.95, 0),
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
            alignment: AlignmentDirectional(0.00, -0.20),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.35,
              height: MediaQuery.of(context).size.height / 1.3,
              //color: Colors.blue,
              child: CarouselSlider.builder(
                  carouselController: caro,
                  options: CarouselOptions(
                      height: 270,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.90,
                      onPageChanged: (index, reason) {
                        audioCache.play(numbers[index].pronounciation);
                      },
                      autoPlayCurve: Curves.fastOutSlowIn),
                  itemCount: numbers.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height / 2.3,
                            width: MediaQuery.of(context).size.width / 4.5,
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                                numbers[index].num,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 130,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Freshman'),
                              ),
                            )),
                        Text(
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
                              imageUrl: numbers[index].dialogImage,
                              progressIndicatorBuilder:
                                              (context, url, downloadProgress) =>
                                                  SpinKitDualRing(
                                                      color: Colors.amberAccent),
                                          // CircularProgressIndicator(
                                          //     value: downloadProgress.progress),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                              fit: BoxFit.fill),
                          decoration: BoxDecoration(
                            //color: Color(0xFFFFFFF0),
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        )
                      ],
                    );
                  }),
            ),
          )
        ]),
      ))),
    );
    
  }
}

class NumbersLearn {
  String num;
  String dialogImage;
  String pronounciation;

  NumbersLearn({
    this.num,
    this.dialogImage,
    this.pronounciation,
  });
}
