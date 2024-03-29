class MatchGameModel {
  final String name;
  final String image;
  final String value;
  bool accepting;
  String? music = "";
  String? audio = "";

  MatchGameModel({this.music, required this.name, required this.image, this.audio, required this.value, this.accepting = false});

  static List<MatchGameModel> fruitsItems = [
    MatchGameModel(
      value: 'banana',
      name: 'Banana',
      image: 'https://assets8.lottiefiles.com/packages/lf20_kyusfkfp.json',
      audio: "banana.wav",
    ),
    // MatchGameModel(
    //   value: 'orange',
    //   name: 'Orange',
    //   image: 'https://assets9.lottiefiles.com/packages/lf20_pfsppq45.json',
    //   audio: "orange.wav",
    // ),
    MatchGameModel(
      value: 'pears',
      name: 'Pears',
      image: 'https://assets9.lottiefiles.com/packages/lf20_opljg7yp.json',
      audio: "pears.wav",
    ),
    // MatchGameModel(
    //   value: 'pineapple',
    //   name: 'Pineapple',
    //   image: 'https://assets8.lottiefiles.com/packages/lf20_etiq0fbs.json',
    //   audio: "pineapple.wav",
    // ),
    MatchGameModel(
      value: 'mango',
      name: 'Mango',
      image: 'https://assets8.lottiefiles.com/packages/lf20_sas45b58.json',
      audio: "mango.wav",
    ),
    MatchGameModel(
      value: 'Watermelon',
      name: 'Watermelon',
      image: 'https://assets8.lottiefiles.com/packages/lf20_n2nxpuho.json',
      audio: "watermelon.wav",
    ),
    MatchGameModel(
      value: 'grapes',
      name: 'Grapes',
      image: 'https://media.baamboozle.com/uploads/images/117411/1619424207_176960_url.gif',
      audio: "grapes.wav",
    ),
    MatchGameModel(
      value: 'carrot',
      name: 'Carrot',
      image: 'https://assets7.lottiefiles.com/packages/lf20_y3pev23v.json',
      audio: "carrot.wav",
    ),
  ];

  static List<MatchGameModel> animalsItems = [
    MatchGameModel(value: 'dog', name: 'Dog', audio: 'dog,.wav', image: 'https://assets1.lottiefiles.com/private_files/lf30_h8chtt4u.json', music: 'dog_voice.wav'),
    MatchGameModel(value: 'lion', name: 'Lion', audio: 'lion,.wav', image: 'https://assets6.lottiefiles.com/packages/lf20_vmollwvl.json', music: 'lion.mp3'),
    MatchGameModel(value: 'owl', name: 'Owl', audio: 'owl,.wav', image: 'https://assets2.lottiefiles.com/packages/lf20_xGSFL9.json', music: 'owl.wav'),
    MatchGameModel(value: 'elephant', name: 'Elephant', audio: 'elephant,.wav', image: 'https://i.pinimg.com/originals/a7/59/7f/a7597f0db79302ae9506f1d557dfd318.gif', music: 'elephant.wav'),
    MatchGameModel(value: 'monkey', name: 'Monkey', audio: 'monkey,.wav', image: 'https://assets10.lottiefiles.com/packages/lf20_gvxqafpw.json', music: 'monkey.mp3'),
    MatchGameModel(
        value: 'cow',
        name: 'Cow',
        audio: 'cow,.wav',
        image: 'https://terasaath.in/coww.gif',
        //'https://i.pinimg.com/originals/a2/01/4f/a2014f435ab140e724923d6d594ca935.gif',
        music: 'cow.mp3'),
    MatchGameModel(value: 'bee', name: 'Honey bee', audio: 'bee,.wav', image: 'https://assets9.lottiefiles.com/private_files/lf30_ldieofjb.json', music: 'bee.mp3'),
    MatchGameModel(
        value: 'penguin',
        name: 'Penguin',
        audio: 'penguin,.wav',
        image: 'https://i.pinimg.com/originals/66/8c/3b/668c3bd964c155eeec4a911e50fb59f7.gif',
        //'https://assets5.lottiefiles.com/packages/lf20_44y9y3ky.json',
        //'https://assets8.lottiefiles.com/packages/lf20_44y9y3ky.json',
        music: 'penguin.mp3'), //desktop file
    MatchGameModel(value: 'butterfly', name: 'Butterfly', audio: 'butterfly,.wav', image: 'https://assets10.lottiefiles.com/private_files/lf30_ce3fctyu.json', music: 'butterfly.mp3'),
    MatchGameModel(value: 'caterpillar', name: 'Caterpillar', audio: 'caterpillar,.wav', image: 'https://assets6.lottiefiles.com/packages/lf20_opjebefq.json', music: ''),
    // MatchGameModel(
    //     value: 'turtle',
    //     name: 'Turtle',
    //     image:
    //         'https://assets10.lottiefiles.com/private_files/lf30_51d8pwk4.json',
    //     music: 'panda.wav'),
    // MatchGameModel(
    //     value: 'croc',
    //     name: 'Crocodile',
    //     image: 'https://assets9.lottiefiles.com/packages/lf20_f54ylzjs.json',
    //     music: 'owl.wav'),
    MatchGameModel(value: 'duck', name: 'Duck', audio: 'duck,.wav', image: 'https://assets2.lottiefiles.com/private_files/lf30_oiaetlzu.json', music: 'duck.mp3'),
    MatchGameModel(
        value: 'cat',
        name: 'Cat',
        audio: 'cat,.wav',
        //https://assets1.lottiefiles.com/private_files/lf30_b91uuvwz.json
        image: 'https://assets10.lottiefiles.com/private_files/lf30_axnm9fti.json',
        music: 'cat.mp3'),
    // MatchGameModel(
    //     value: 'kangaroo',
    //     name: 'Kangaroo',
    //     image: 'https://assets8.lottiefiles.com/packages/lf20_odsaqoyl.json',
    //     music: 'owl.wav'),
  ];
}
