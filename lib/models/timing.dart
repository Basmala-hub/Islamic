class Timing {
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Sunset;
  final String Maghrib;
  final String Isha;
  final String Imsak;
  final String Midnight;
  final String Firstthird;
  final String Lastthird;

  const Timing(
      {required this.Fajr,
      required this.Sunrise,
      required this.Dhuhr,
      required this.Asr,
      required this.Sunset,
      required this.Maghrib,
      required this.Isha,
      required this.Imsak,
      required this.Midnight,
      required this.Firstthird,
      required this.Lastthird});

  String toString() {
    return "Fajr: $Fajr, Dhuhr: $Dhuhr, Asr: $Asr, Maghrib: $Maghrib, Isha: $Isha,Sunrise :$Sunrise,Sunset :$Sunset,Imsak :$Imsak,Midnight :$Midnight,Firstthird :$Firstthird,Lastthird :$Lastthird";
  }
}
