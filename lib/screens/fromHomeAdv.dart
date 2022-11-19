import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/advertisementPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime date;
  Future pickDate(BuildContext context) async {
    final initiaDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initiaDate,
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) {
      return;
    }
    setState(() => date = newDate);
  }

  @override
  Widget build(BuildContext context) {
    void Add() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdvPage()),
      );
    }

    void Delete() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdvPage()),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 216, 171),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Center(
            child: Text(
              "Opisz produkty którymi",
              style: GoogleFonts.secularOne(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              "Chcesz się podzeilić:",
              style: GoogleFonts.secularOne(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tytuł ogłoszenia",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Adres zamieszkania / spotkania",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Miasto Zamieszkania",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "opisz produkt i podaj date ważności",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() => pickDate(context)),
                child: Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color.fromARGB(255, 236, 235, 235),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                GestureDetector(
                  onTap: Add,
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: Delete,
                  child: Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ))),
    );
  }
}
