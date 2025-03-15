import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic/manager/cubit.dart';
import 'package:islamic/manager/state.dart';

import 'adha.dart';
import 'data of surah.dart';
import 'new tasks.dart';
import 'tasbah.dart';
import 'time of salah.dart';

class WholeService extends StatefulWidget {
  const WholeService({super.key});

  @override
  State<WholeService> createState() => _WholeServiceState();
}

class _WholeServiceState extends State<WholeService> {
  int indexChange = 0;

  @override
  void initState() {
    super.initState();
    _loadDataForTab(indexChange);
  }

  void _loadDataForTab(int index) {
    final cubit = context.read<AppCubit>();
    if (index == 0) {
      cubit.fetchSurah();
    } else if (index == 1) {
      cubit.fetchTime();
    } else if (index == 2) {
      cubit.fetcWholeSurah();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DataOfSurah(),
      TimingOfSalah(),
      Adah(),
      Sabha(),
      NewTasks()
    ];

    return BlocProvider.value(
      value: context.read<AppCubit>(),
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xFFB87333),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black87,
            currentIndex: indexChange,
            onTap: (index) {
              setState(() {
                indexChange = index;
                _loadDataForTab(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: Offset(0, indexChange == 0 ? -10 : 0),
                  child: Icon(Icons.menu_book, size: 30),
                ),
                label: "الفهرس",
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: Offset(0, indexChange == 1 ? -10 : 0),
                  child: Icon(Icons.access_time, size: 30),
                ),
                label: "مواقيت",
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: Offset(0, indexChange == 2 ? -10 : 0),
                  child: FaIcon(FontAwesomeIcons.prayingHands, size: 30),
                ),
                label: "الادعية",
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: Offset(0, indexChange == 3 ? -10 : 0),
                  child: FaIcon(FontAwesomeIcons.fingerprint, size: 30),
                ),
                label: "سبحة",
              ),
              BottomNavigationBarItem(
                icon: Transform.translate(
                  offset: Offset(0, indexChange == 4 ? -10 : 0),
                  child: Icon(Icons.event_note, size: 30),
                ),
                label: "Tasks",
              ),
            ],
          ),
        ),
        body: pages[indexChange],
      ),
    );
  }
}