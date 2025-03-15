class Surah {
  final int number;

  final String name;

  final String englishName;

  final String englishNameTranslation;

  final int numberOfAyahs;

  final String revelationType;

  Surah(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.numberOfAyahs,
      required this.revelationType});

  String toString() {
    return "number :$number, name:$name, englishName:$englishName,englishNameTranslation:$englishNameTranslation,numberOfAyahs:$numberOfAyahs,revelationType:$revelationType";
  }
}
