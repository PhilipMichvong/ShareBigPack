// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ADVwidget extends StatefulWidget {
  const ADVwidget({super.key});

  @override
  State<ADVwidget> createState() => _ADVwidgetState();
}

var _currPageval = 0.0;
double _scaleFactor = 0.80;
double _height = 220;

class _ADVwidgetState extends State<ADVwidget> {
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageval = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageval,
          decorator: DotsDecorator(
            activeColor: Color.fromARGB(255, 35, 216, 171),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}

Widget _buildPageItem(int index) {
  Matrix4 matrix = new Matrix4.identity();
  // TODO: implement animation between shops enarby
  if (index == _currPageval.floor()) {
    var currScale = 1 - (_currPageval - index) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  } else if (index == _currPageval.floor() + 1) {
    var currScale =
        _scaleFactor + (_currPageval = index + 1) * (1 - _scaleFactor);
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1);
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(0, currTrans, 0);
  }
  return Stack(
    children: [
      Container(
        height: 220,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF69c5df),
            // ignore: prefer_const_constructors

            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/lidl.png",
                ))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 130,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 19, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lidl ul. Powstańców śląskich",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 35, 216, 171),
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "(Wedłóg ocen google)",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Color.fromARGB(255, 35, 216, 171),
                    ),
                    Text("Tanio"),
                    Icon(
                      Icons.pin_drop,
                      color: Colors.orange,
                    ),
                    Text("1.4km"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
