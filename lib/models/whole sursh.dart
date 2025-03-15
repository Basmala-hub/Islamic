import 'ayha.dart';

class WholeSurah {
  final String name;
 final List<AyahModel>ayahs;


  WholeSurah( {required this.name, required this.ayahs});
  @override
 String toString(){
    return "name :$name,text: $ayahs ";
  }
}
