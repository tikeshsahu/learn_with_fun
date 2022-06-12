class AlphabetsReadingModel {
   String alphabet;
   String value;
  bool accepting;
   String pronounciation;

  AlphabetsReadingModel(
      {this.alphabet, this.value, this.pronounciation});

String  getAlphabet() {
    return alphabet;
  }
 
  set setAlphabet(String alphabet) {
    alphabet = alphabet;
  }
  String  getValue() {
    return value;
  }
 
  set setValue(String value) {
    value = value;
  }
  String  getPronounciation() {
    return pronounciation;
  }
 
  set setPronounciation(String pronounciation) {
    pronounciation = pronounciation;
  }

}

