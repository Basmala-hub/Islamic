import 'package:dio/dio.dart';

import '../models/ayha.dart';
import '../models/surah.dart';
import '../models/timing.dart';
import '../models/whole sursh.dart';

class ApiService {
  Dio dio = Dio();

  Future<Timing> getTime() async {
    var response = await dio.get(
      "https://api.aladhan.com/v1/timingsByCity/15-02-2024?country=egypt&city=cairo",
    );

    Map<String, dynamic> json = response.data;
    Map<String, dynamic> timings = json["data"]["timings"];

    return Timing(
      Asr: timings["Asr"],
      Dhuhr: timings["Dhuhr"],
      Fajr: timings["Fajr"],
      Firstthird: timings["Firstthird"],
      Imsak: timings["Imsak"],
      Isha: timings["Isha"],
      Lastthird: timings["Lastthird"],
      Maghrib: timings["Maghrib"],
      Midnight: timings["Midnight"],
      Sunrise: timings["Sunrise"],
      Sunset: timings["Sunset"],
    );
  }

  getSurah() async {
    List<Surah> surah = [];
    var response = await dio.get("https://api.alquran.cloud/v1/surah");
    var json = response.data;
    for (var i in json["data"]) {
      surah.add(Surah(
          name: i["name"],
          englishName: i["englishName"],
          englishNameTranslation: i["englishNameTranslation"],
          number: i["number"],
          numberOfAyahs: i["numberOfAyahs"],
          revelationType: i["revelationType"]));
    }
    return surah;
  }

  getWholeSurah() async {
    var response = await dio.get("http://api.alquran.cloud/v1/quran/ar.alafasy");
    var json = response.data;

    List<WholeSurah> whole = [];

    for (var surah in json["data"]["surahs"]) {
      List<AyahModel> ayahs = (surah["ayahs"] as List)
          .map((ayah) {
            return AyahModel(
              text: ayah["text"].toString(),
              audio: ayah["audio"],
            );
      }).toList();

      whole.add(WholeSurah(name: surah["name"], ayahs: ayahs)); // تعديل اسم المتغير ليتوافق مع الـ Model
    }

    return whole;
  }

}

void main() async {
  ApiService x = ApiService();
  var z = await x.getWholeSurah();
  print(z);
}
