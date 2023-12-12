class Professtions {
  final String name;
  final String image;
  final String pronounciation;
  //final String vid;

  Professtions({required this.name, required this.image, required this.pronounciation});

  static List<Professtions> pros = [
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
}
