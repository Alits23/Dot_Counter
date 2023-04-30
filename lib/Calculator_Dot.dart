int DotCalculator(String words) {
  String text = '${words}';
  int dotsCount = 0;

  var singleDots = ["ب", "ج", "خ", "ذ", "ز", "ض", "ظ", "غ", "ف", "ن"];
  var doubleDots = ["ت", "ق"];
  var tripleDots = ["پ", "ث", "چ", "ژ", "ش"];
  var midLetterDots = ["ی"];

  for (var i = 0; i < text.length; i++) {
    var letter = text[i];
    if (singleDots.contains(letter)) {
      dotsCount++;
    }
    ;
    if (doubleDots.contains(letter)) {
      dotsCount += 2;
    }
    ;
    if (tripleDots.contains(letter)) {
      dotsCount += 3;
    }

    if (midLetterDots.contains(letter) && i < text.length - 1) {
      if (text[i + 1] != ' ') {
        dotsCount += 2;
      }
    }
  }
  return dotsCount;
}
