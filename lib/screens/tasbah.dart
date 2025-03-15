import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';

import '../local database.dart';

class Sabha extends StatefulWidget {
  const Sabha({super.key});

  @override
  State<Sabha> createState() => _SabhaState();
}

class _SabhaState extends State<Sabha> {
  @override
  void initState() {
    super.initState();
    createDataBase().then((_) async {
      sabha = await getDataBase();
      if (sabha.isNotEmpty) {
        number = sabha.last["sabhaNumber"] ?? 0;
      }
      setState(() {});
    });
  }

  List<Map<String, dynamic>> sabha = [];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.brown.shade300,
          onPressed: () async {
            setState(() {
              number++;
            });

            await insertDataBase(sabhaNumber: number);

            sabha = await getDataBase();
            setState(() {});
          },
          child: FaIcon(
            FontAwesomeIcons.fingerprint,
            size: 60, // حجم الأيقونة
            color: Colors.black87, // لون الأيقونة
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFB87333),
        centerTitle: true,
        title: Text(
          "سبحة",
          style: TextStyle(
            fontFamily: "Noto Kufi Arabic",
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context,"WholeSerivce" );
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/image2.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                sabha.isNotEmpty ? sabha.last["sabhaNumber"].toString() : "0",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Noto Kufi Arabic",
                    fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
