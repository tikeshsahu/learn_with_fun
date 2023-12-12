class Vehicles {
  final String name;
  final String image;
  final String audio;
  //final String vid;

  Vehicles({required this.name, required this.image, required this.audio});

  static List<Vehicles> gaddi = [
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
      image: 'https://terasaath.in/vehBike.png',
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
      image: 'https://terasaath.in/vehFire.png',
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
      image: 'https://terasaath.in/vehTruck.png',
      //'https://img.freepik.com/free-vector/blue-orange-truck-isolated_1308-27814.jpg?w=1380&t=st=1659544653~exp=1659545253~hmac=5b53f62ef1a26868554900d21e66fda1c9523602584d475432a68f02b275c6e1',
    ),
    Vehicles(
        name: 'Bus', audio: 'bus.wav', image: 'https://terasaath.in/proBus.png'
        //'https://img.freepik.com/premium-vector/cartoon-school-bus-with-children-back-school-concept_152098-378.jpg?w=826',

        ),
  ];
}
