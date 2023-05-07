class AlphabetsReadingModel {
  String image;
  String forImage;
  bool itemIsPressed = false;
  String pronounciation;
  String title;
  String description;

  AlphabetsReadingModel(
      {this.image,
      this.forImage,
      this.pronounciation,
      this.itemIsPressed,
      this.title,
      this.description});

  static List<AlphabetsReadingModel> alphabets = [
    AlphabetsReadingModel(
        title: 'A',
        description: 'A  for  Apple',
        image: "assets/Alphabets/image/A.png",
        forImage:
            "https://assets5.lottiefiles.com/private_files/lf30_03o4rzc9.json",
        pronounciation: "AA.mp3",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'B',
        description: 'B  for  Boy',
        image: "assets/Alphabets/image/B.png",
        forImage: "https://assets8.lottiefiles.com/packages/lf20_x9puwsf6.json",
        pronounciation: "BA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'C',
        description: 'C  for  Car',
        image: "assets/Alphabets/image/C.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_8NYY2Y.json",
        pronounciation: "CA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'D',
        description: 'D  for  Dog',
        image: "assets/Alphabets/image/D.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_PXcBlV.json",
        pronounciation: "DA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'E',
        description: 'E  for  Elephant',
        image: "assets/Alphabets/image/E.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_xgwzkywz.json",
        pronounciation: "EA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'F',
        description: 'F  for  Fish',
        image: "assets/Alphabets/image/F.png",
        forImage: "https://assets6.lottiefiles.com/packages/lf20_t6zvi4la.json",
        pronounciation: "FA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'G',
        description: 'G  for  Grapes',
        image: "assets/Alphabets/image/G.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_ayb8hcrh.json",
        pronounciation: "GA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'H',
        description: 'H  for  Hen',
        image: "assets/Alphabets/image/H.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_nalpzjl6.json",
        pronounciation: "HA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'I',
        description: 'I  for  IceCream',
        image: "assets/Alphabets/image/I.png",
        forImage: "https://assets8.lottiefiles.com/packages/lf20_glqkl1qa.json",
        pronounciation: "IA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'J',
        description: 'J  for  Joker',
        image: "assets/Alphabets/image/J.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_txyga2ag.json",
        pronounciation: "JA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'K',
        description: 'K  for  Kite',
        image: "assets/Alphabets/image/K.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_6ef4hgzm.json",
        pronounciation: "KA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'L',
        description: 'L  for  Lion',
        image: "assets/Alphabets/image/L.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_vmollwvl.json",
        pronounciation: "LA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'M',
        description: 'M  for  Monkey',
        image: "assets/Alphabets/image/M.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_q7uarxsb.json",
        pronounciation: "MA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'N',
        description: 'N  for  Notebook',
        image: "assets/Alphabets/image/N.png",
        forImage:
            "https://assets10.lottiefiles.com/private_files/lf30_cldvedro.json",
        pronounciation: "NA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'O',
        description: 'O  for  Owl',
        image: "assets/Alphabets/image/O.png",
        forImage: "https://assets2.lottiefiles.com/packages/lf20_xGSFL9.json",
        pronounciation: "OA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'P',
        description: 'P  for  Pencil',
        image: "assets/Alphabets/image/P.png",
        forImage: "https://assets3.lottiefiles.com/packages/lf20_z7dwyelr.json",
        pronounciation: "PA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Q',
        description: 'Q  for  Queen',
        image: "assets/Alphabets/image/Q.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_zergdtgj.json",
        pronounciation: "QA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'R',
        description: 'R  for  Rabbit',
        image: "assets/Alphabets/image/R.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_3iiqbu3x.json",
        pronounciation: "RA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'S',
        description: 'S  for  Sun',
        image: "assets/Alphabets/image/S.png",
        forImage:
            "https://assets6.lottiefiles.com/private_files/lf30_6gqfjgqh.json",
        pronounciation: "SA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'T',
        description: 'T  for  Tomato',
        image: "assets/Alphabets/image/T.png",
        forImage: "https://assets7.lottiefiles.com/packages/lf20_zkhpkpyc.json",
        pronounciation: "TA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'U',
        description: 'U  for  Umbrella',
        image: "assets/Alphabets/image/U.png",
        forImage: "https://assets4.lottiefiles.com/packages/lf20_DyDkQs.json",
        pronounciation: "UA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'V',
        description: 'V  for  Van',
        image: "assets/Alphabets/image/V.png",
        forImage: "https://assets1.lottiefiles.com/packages/lf20_8SfnRn.json",
        pronounciation: "VA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'W',
        description: 'W  for  Watermelon',
        image: "assets/Alphabets/image/W.png",
        forImage:
            "https://assets3.lottiefiles.com/datafiles/0cjunjXZVrOzIAb/data.json",
        pronounciation: "WA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'X',
        description: 'X  for  Xylophone',
        image: "assets/Alphabets/image/X.png",
        forImage: "https://assets5.lottiefiles.com/packages/lf20_yeh2DQ.json",
        pronounciation: "XA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Y',
        description: 'Y  for  Yoga',
        image: "assets/Alphabets/image/Y.png",
        forImage:
            "https://assets7.lottiefiles.com/packages/lf20_01kulrrn/yoga.json",
        pronounciation: "YA.wav",
        itemIsPressed: false),
    AlphabetsReadingModel(
        title: 'Z',
        description: 'Z  for  Zebra',
        image: "assets/Alphabets/image/Z.png",
        forImage:
            'https://media.baamboozle.com/uploads/images/51668/1644508771_88855_gif-url.gif',
        //"https://assets9.lottiefiles.com/packages/lf20_5tg9fwbp.json",
        pronounciation: "ZA.wav",
        itemIsPressed: false),
  ];
}
