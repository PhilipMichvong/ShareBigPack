import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final _TextContolerPaswd = TextEditingController();
    final _TextContolerLogin = TextEditingController();
    final _TextContolerPaswdAgain = TextEditingController();
    // funkcja do rejestrowania
    void Login_page() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home_Page()),
      );
    }

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
                    "Witaj!",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Zarejestruj się i marnuj",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 114, 108, 108),
                    ),
                  ),
                  Text(
                    "mniej jedzenia już dziś",
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
                  SizedBox(
                    height: 20,
                  ),
                  // ponownie haslo
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
                          controller: _TextContolerPaswdAgain,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "podaj ponownie Haslo",
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
                    onTap: Login_page,
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
                            "Zarejestruj się",
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
                      Text("Masz już konto? "),
                      GestureDetector(
                        onTap: Login_page,
                        child: Text(
                          "Zaloguj się",
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
