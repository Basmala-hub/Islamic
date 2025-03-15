import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit.dart';
import '../manager/state.dart';

class TimingOfSalah extends StatelessWidget {
  const TimingOfSalah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end, // يجعل النص في أقصى اليمين
          children: [
            Text(
              "مواقيت الصلاة",
              style: TextStyle(
                fontFamily: "Noto Kufi Arabic",
                fontSize: 20,
              ),
            ),
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "WholeSerivce");
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            List<Map<String, String>> prayerTimes = [
              {'name': 'الفجر', 'time': '${state.time.Fajr}.'},
              {'name': 'الشروق', 'time': '${state.time.Sunrise}'},
              {'name': 'الظهر', 'time': '${state.time.Dhuhr}'},
              {'name': 'العصر', 'time': '${state.time.Asr}'},
              {'name': 'المغرب', 'time': '${state.time.Maghrib}'},
              {'name': 'العشاء', 'time': '${state.time.Isha}'},
              {'name': 'الربع الاول', 'time': '${state.time.Firstthird}'},
              {'name': 'منتصف الليل', 'time': '${state.time.Midnight}'},
              {'name': 'التلت الاخير', 'time': '${state.time.Lastthird}'},
              {'name': 'الامساك', 'time': '${state.time.Imsak}'},
              {'name': ' غروب الشمس', 'time': '${state.time.Sunset}'},
            ];
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFB87333),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ]),
                    height: 1000,
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${prayerTimes[index]['name']} ${prayerTimes[index]['time']}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Noto Kufi Arabic"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: prayerTimes.length,
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
