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

  void toggleItemIsPressed() {}
  void setItemIsPressed(bool value) {
    itemIsPressed = value;
  }
}
