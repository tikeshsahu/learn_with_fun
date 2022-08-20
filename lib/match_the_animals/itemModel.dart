class ItemModel {
  final String name;
  final String image;
  final String value;
  bool accepting;
  final String music;
  final String audio;

  ItemModel(
      {this.music, this.name, this.image,this.audio, this.value, this.accepting = false});
}
