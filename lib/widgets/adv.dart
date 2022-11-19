import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/ADVinfo.dart';

class ADV extends StatelessWidget {
  final ADVinfo adv_list;
  const ADV({super.key, required this.adv_list});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Column(
          children: [
            Container(
              width: 350,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Color.fromARGB(255, 35, 216, 171),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(adv_list.User!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.title,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(adv_list.title!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_grocery_store_rounded,
                          color: Colors.red),
                      SizedBox(
                        width: 20,
                      ),
                      Text(adv_list.shop!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(adv_list.Location!),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 216, 171),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.question_mark_sharp,
                    color: Colors.white,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.white,
                  ),
                  Text(
                    "Dowiedz się więcej",
                    style: GoogleFonts.secularOne(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
