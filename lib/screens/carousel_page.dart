import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamic/list_data_carousel.dart';

import 'login screen.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  String selectedButton = ""; // يحدد أي زر نشط حاليًا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
          ),
          items: data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(i.image),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            i.topText,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Noto Kufi Arabic"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: true,
                                i.medialText,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Noto Kufi Arabic")),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: selectedButton == i.button1
                                        ? Colors.white
                                        : Colors.black87,
                                    elevation: 5,
                                    minimumSize: Size(100, 30)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "LoginScreen");
                                  setState(() {
                                    selectedButton = i.button1;
                                  });
                                },
                                child: Text(
                                  i.button1,
                                  style: TextStyle(
                                      color: selectedButton == i.button1
                                          ? Colors.black
                                          : Colors.brown),
                                ),
                              ),
                              TextButton(

                                style: TextButton.styleFrom(
                                    backgroundColor: selectedButton == i.button2
                                        ? Colors.white
                                        : Colors.black87,
                                    elevation: 5,
                                    minimumSize: Size(100, 30)),
                                onPressed: () {

                                  setState(() {
                                    selectedButton = i.button2;
                                  });
                                },
                                child: Text(
                                  i.button2,
                                  style: TextStyle(
                                      color: selectedButton == i.button2
                                          ? Colors.black
                                          : Colors.brown),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
