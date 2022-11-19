// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/AdvAdd.dart';
import 'package:sharebigpack2/screens/advForm.dart';

class AdvPage extends StatefulWidget {
  const AdvPage({super.key});

  @override
  State<AdvPage> createState() => _AdvPageState();
}

class _AdvPageState extends State<AdvPage> {
  void _advForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const advForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void showAlert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text("hi"),
              ));
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Miasto",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Warszawa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.search, color: Colors.white),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color.fromARGB(255, 35, 216, 171),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("W twojej okolicy: ",
                    style: GoogleFonts.secularOne(
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 15,
                ),
                ADVwidget(),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 35, 216, 171),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: _advForm,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            width: 2,
                            height: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "Dodaj Ogłoszenie",
                            style: GoogleFonts.secularOne(
                              color: Colors.white,
                              fontSize: 18,
                              //fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
