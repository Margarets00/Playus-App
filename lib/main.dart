import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:playus_app/screen/home/home_screen.dart';
import 'package:playus_app/constants.dart';
import 'dart:developer';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLAYuS',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        fontFamily: 'headline_eng',
        textTheme: TextTheme(
            headline2: TextStyle(
                fontFamilyFallback: ['blackHanSans'],
                fontSize: 30,
                wordSpacing: -8,
                color: kTextColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: kPrimaryColor.withOpacity(0.5),
      ),
      home: Intro(),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  _Intro createState() => _Intro();
}

class _Intro extends State<Intro> {
  final String intro = "ANYONE\n\n"
      "CAN\n\n"
      "BE A DJ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Background(
        where: 'bottom',
        height: 0.95,
      ), //백그라운드
      Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07,
                    top: MediaQuery.of(context).size.height * 0.17),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(children: [
                      header(1.0, kSecondaryColor, 0.0, 'Playus'),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02),
                        child: header(1.0, kTextColor, 0.0, 'Playus'),
                      ),
                    ])),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: MediaQuery.of(context).size.height * 0.25,
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: Stack(children: [
                      Button(
                        text: 'START',
                        iconCode: 0xe5e1,
                        wordspace: 0.0,
                        isClick: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              ));
                        },
                      ),
                    ])),
              ),
              //),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.08),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(children: [
                      header(0.5, kSecondaryColor, -15.0, intro),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.017),
                        child: header(0.5, kTextColor, -15.0, intro),
                      ),
                    ])),
              ),
            ],
          ),
        ),
      )
    ]));
  }

  Widget header(height, color, space, text) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
              height: height,
              fontSize: MediaQuery.of(context).size.height *
                  ((text == 'Playus') ? 0.12 : 0.09),
              color: color,
              wordSpacing: space),
        ));
  }
}
