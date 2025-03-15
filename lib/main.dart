import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/cubit.dart';
import 'network/api_service.dart';
import 'screens/carousel_page.dart';
import 'screens/check password.dart';
import 'screens/data of surah.dart';
import 'screens/home screen.dart';
import 'screens/login screen.dart';
import 'screens/new tasks.dart';
import 'screens/password forget.dart';
import 'screens/tasbah.dart';
import 'screens/time of salah.dart';
import 'screens/whole service.dart';
import 'screens/whole surah.dart';

main() {
  runApp(Islamic());
}

class Islamic extends StatefulWidget {
  const Islamic({super.key});

  @override
  State<Islamic> createState() => _IslamicState();
}

class _IslamicState extends State<Islamic> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppCubit(),
      child: MaterialApp(

        routes: {"CarouselPage": (context) => CarouselPage(),
        "LoginScreen":(context)=>LoginScreen(),
        "ForgetPassword":(context)=>ForgetPassword(),
        "CheckPassword":(context)=>CheckPassword(),
        "DataOfSurah":(context)=>DataOfSurah(),
        "WholeSurah":(context)=>WholeSurahScreen(),
        "TimingOfSalah":(context)=>TimingOfSalah(),
        "WholeSerivce":(context)=>WholeService(),
       },
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
