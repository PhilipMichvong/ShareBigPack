import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/advertisementPage.dart';
import 'package:sharebigpack2/botom_bar.dart';

class advForm extends StatefulWidget {
  const advForm({super.key});

  @override
  State<advForm> createState() => _advFormState();
}

class _advFormState extends State<advForm> {
  _Myforamtstate() {
    selectedVal = DropDownitems[0];
  }

  final DropDownitems = ['test1', 'test2', 'test3', 'test4'];
  String? selectedVal = "";
  String? _value1 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 216, 171),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Dodaj Ogłoszenie: ",
                style: GoogleFonts.secularOne(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            // tytul ogloszenia
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tytul ogloszenia",
                    ),
                  ),
                ),
              ),
            ),
            // wybor interesujacego cie sklepu
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Jakie produkty chcesz podzelić?",
                    ),
                  ),
                ),
              ),
            ),
            // ulica sklepu
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Gdzie znajduje sie sklep?",
                    ),
                  ),
                ),
              ),
            ),
            //nazwa sklepu
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nazwa sklepu",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            // dolne przyciski
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // dodanie ogloszenia
                GestureDetector(
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      Icons.check_box,
                      color: Colors.white,
                      size: 75,
                    ),
                  ),
                ),
                // opuszczenie forlumularza dodawaiia ogloszenia
                GestureDetector(
                  onTap: openDialog,
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      //color: Colors.black,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                      size: 75,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Opuszczenie strony",
              style: GoogleFonts.secularOne(fontSize: 25)),
          content: Text(
            "jesteś pewien, że chcesz opuścić formularz? nie zostanie on zapisany",
            style: GoogleFonts.secularOne(
                fontSize: 17, color: Color.fromARGB(255, 31, 31, 31)),
          ),
          actions: [
            TextButton(
              onPressed: _Stay,
              child: Text("Pozostań"),
            ),
            TextButton(
              onPressed: _Quit,
              child: Text("Opuść stronę"),
            ),
          ],
        ),
      );
  void _Stay() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const advForm()),
    );
  }

  void _Quit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdvPage()),
    );
  }
}
