class AyahModel {
  final String text;
  final String audio;

  AyahModel({required this.text, required this.audio});

  String toString() {
    return "text :$text , audio:$audio";
  }
}
