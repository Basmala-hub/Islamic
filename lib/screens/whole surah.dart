import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../local database.dart';
import '../manager/cubit.dart';
import '../manager/state.dart';
import '../models/whole sursh.dart';

class WholeSurahScreen extends StatefulWidget {
  const WholeSurahScreen({super.key});

  @override
  State<WholeSurahScreen> createState() => _WholeSurahScreenState();
}

class _WholeSurahScreenState extends State<WholeSurahScreen> {
  @override
  void initState() {
    super.initState();
    createDataBase().then((_) async {
      safha = await getDataBase();
      if (safha.isNotEmpty) {
        name = safha.last["aya"] ?? "lol";
      }
      setState(() {});
    });

    player.onPlayerComplete.listen((_) {
      playNextAyah();
    });
  }
  TextEditingController textEditingController=TextEditingController();
  String name = "";
  List<Map<String, dynamic>> safha = [];
  final AudioPlayer player = AudioPlayer();
  int _currentAyahIndex = 0;
  List<String> ayahAudioUrls = [];
  Color colors = Colors.white;

  void playAyah(int index) async {
    if (index < ayahAudioUrls.length) {
      try {
        await player.play(UrlSource(ayahAudioUrls[index]));
        setState(() {
          _currentAyahIndex = index;
          colors = Colors.tealAccent;
        });
      } catch (e) {
        print("❌ خطأ في تشغيل الصوت: $e");
      }
    }
  }

  void playNextAyah() {
    if (_currentAyahIndex + 1 < ayahAudioUrls.length) {
      playAyah(_currentAyahIndex + 1);
    } else {
      print("✅ انتهت السورة!");
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nameOfSurah =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    name = nameOfSurah["name"];
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3E5),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("أدخل رقم الآية"),
                    content: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "رقم الآية"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          int? ayaNumber = int.tryParse(textEditingController.text);
                          if (ayaNumber != null) {
                            insertDataBase(aya: name, ayaNumber: ayaNumber);
                            Navigator.pop(context); // إغلاق النافذة بعد الحفظ
                          } else {
                            print("❌ أدخل رقم صحيح!");
                          }
                        },
                        child: Text("حفظ"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.save_outlined),
          )
        ],
        title: Text(
          nameOfSurah["name"],
          style: const TextStyle(fontFamily: "Noto Kufi Arabic"),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WholeSurahLoaded) {
            final filteredSurah = state.wholeSurah.firstWhere(
              (surah) => surah.name == nameOfSurah["name"],
              orElse: () => WholeSurah(name: "", ayahs: []),
            );
            final surahModified = filteredSurah.ayahs
                .map((ayah) => ayah.text.replaceAll("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ","")).toList();


            print(surahModified);

            if (filteredSurah.ayahs.isEmpty) {
              return const Center(
                  child: Text("⚠️ لم يتم العثور على السورة المطلوبة."));
            }

            ayahAudioUrls =
                filteredSurah.ayahs.map((ayah) => ayah.audio).toList();

            if (_currentAyahIndex == 0 && ayahAudioUrls.isNotEmpty) {
              playAyah(_currentAyahIndex);
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  if (nameOfSurah["name"] != "سُورَةُ التَّوۡبَةِ")
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Wrap(children: [
                        Text(
                          softWrap: true,
                          "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Noto Kufi Arabic",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                    ),
                  Wrap(
                    children: surahModified.asMap().entries.map((entry) {
                      int index = entry.key;
                      var ayahText = entry.value;

                      return Container(
                        color: index == _currentAyahIndex
                            ? Colors.tealAccent
                            : Colors.transparent,
                        // تغيير لون الخلفية للآية الحالية فقط
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Noto Kufi Arabic",
                                fontWeight: FontWeight.w500,
                                height: 2,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text:ayahText ),
                                TextSpan(
                                  text: " ﴿${index + 1}﴾",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          } else if (state is ErrorState) {
            return Center(child: Text("خطأ: ${state.error}"));
          }
          return Container();
        },
      ),
    );
  }
}
