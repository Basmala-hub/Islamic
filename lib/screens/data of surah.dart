import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit.dart';
import '../manager/state.dart';

class DataOfSurah extends StatelessWidget {
  const DataOfSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textAlign: TextAlign.right,
              "الفهرس",
              style: TextStyle(fontFamily: "Noto Kufi Arabic"),
            ),
          ],
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SurahLoadedState) {
          print(state);
          return ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  onTap: () {
                    final cubit = context.read<AppCubit>();
                    cubit.fetcWholeSurah();

                    Navigator.pushNamed(
                      context,
                      "WholeSurah",
                      arguments: {"name": state.surah[index].name},
                    );
                  }
                  ,
                  title: Text(
                    textAlign: TextAlign.right,
                    state.surah[index].name,
                    style: TextStyle(
                        fontFamily: "Noto Kufi Arabic",
                        color: Color(0xFFB87333)),
                  ),
                  subtitle: Text(
                    state.surah[index].englishName,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: "Noto Kufi Arabic", color: Colors.grey),
                  ),
                  leading: Column(
                    children: [
                      Text(
                        "عدد الايات",
                        style: TextStyle(
                            fontFamily: "Noto Kufi Arabic", color: Colors.grey),
                      ),
                      Text(
                        " ${state.surah[index].numberOfAyahs}",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Noto Kufi Arabic",
                            color: Color(0xFFB87333)),
                      )
                    ],
                  ),
                  trailing: Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Color(0xFFB87333),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      textAlign: TextAlign.right,
                      "${state.surah[index].number}",
                      style: TextStyle(
                          fontFamily: "Noto Kufi Arabic", color: Colors.white),
                    ),
                  ),
                ),
              );
            },
            itemCount: state.surah.length,
          );
        } else if (state is ErrorState) {
          return Center(child: Text("خطأ: ${state.error}"));
        }
        return Container(
          color: Colors.white,
        );
      }),
    );
  }
}
