import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/screens/advForm.dart';
import 'package:sharebigpack2/screens/fromHomeAdv.dart';

class TypeOf extends StatefulWidget {
  const TypeOf({super.key});

  @override
  State<TypeOf> createState() => _TypeOfState();
}

class _TypeOfState extends State<TypeOf> {
  @override
  Widget build(BuildContext context) {
    void go_Shop() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const advForm()),
      );
    }

    void go_Home() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 216, 171),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(
                  "Wybierz rodzaj interesującego",
                  style:
                      GoogleFonts.secularOne(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "Cię ogłoszenia:",
                  style:
                      GoogleFonts.secularOne(color: Colors.white, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              GestureDetector(
                onTap: go_Home,
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: Colors.white,
                          size: 30,
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.white,
                        ),
                        Text(
                          "    Produkty z domu",
                          style: GoogleFonts.secularOne(
                              color: Colors.white, fontSize: 17),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              GestureDetector(
                onTap: go_Shop,
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.local_grocery_store_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                        Container(
                          width: 2,
                          height: 40,
                          color: Colors.white,
                        ),
                        Text(
                          "Produkty sklepowe",
                          style: GoogleFonts.secularOne(
                              color: Colors.white, fontSize: 17),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
