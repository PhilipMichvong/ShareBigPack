// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/Register.dart';
import 'package:sharebigpack2/advertisementPage.dart';
import 'package:sharebigpack2/botom_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String name = "Wojtek";
  // controler
  final _TextContolerPaswd = TextEditingController();
  final _TextContolerLogin = TextEditingController();
  // funkcja do rejestrowania
  void Register_page() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  Future<void> login() async{
    Map<String, String> headers = {'Content-Type':'application/json', 'Accept':'/'};
    final msg = jsonEncode({"login":_TextContolerLogin.text, "password":_TextContolerPaswd.text});
    if(_TextContolerLogin.text.isNotEmpty && _TextContolerPaswd.text.isNotEmpty){
      var response = await http.post(Uri.parse("http://127.0.0.1:50666/login"),
      headers:headers,
      body:msg
      );
      if(response.statusCode == 200){
        Post_page();
      }else{
        print("Złe dane logowania.");
      }
    }else{
      print("Wypelnij obydwa pola!");
    }
}

  void Post_page() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdvPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  // logo

                  Container(
                    height: 200,
                    width: 220,
                    child: Image.asset('assets/logo.png'),
                  ),
                  // przywitanie z uzytkownikiem
                  Text(
                    "Witaj Ponownie!",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Zaloguj się by w pełni",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 108, 108),
                    ),
                  ),
                  Text(
                    "możliwości ShareBigPack",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 108, 108),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color.fromARGB(255, 211, 210, 210),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: TextField(
                          controller: _TextContolerLogin,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // haslo
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color.fromARGB(255, 211, 210, 210),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: TextField(
                          controller: _TextContolerPaswd,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Haslo",
                          ),
                        ),
                      ),
                    ),
                  ),
                  // guzik do logowania
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: Post_page,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        padding: EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromARGB(255, 135, 23, 155),
                        ),
                        child: Center(
                          child: Text(
                            "Zaloguj się",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // tworzenie konta
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nie masz jeszcze konta?  "),
                      GestureDetector(
                        onTap: Register_page,
                        child: Text(
                          "Zarejestruj się już teraz!",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
