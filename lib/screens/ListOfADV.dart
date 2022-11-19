import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharebigpack2/widgets/adv.dart';

import '../ADVinfo.dart';

class ListOFADV extends StatelessWidget {
  const ListOFADV({Key? key}) : super(key: key);
  //const ListOFADV({super.key});

  @override
  Widget build(BuildContext context) {
    final ListOfADV = ADVinfo.ADV_list();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 37,
              ),
              Text(
                "Ogłoszenia z twojej okolicy: ",
                style: GoogleFonts.secularOne(fontSize: 22),
              ),
              for (ADVinfo adv in ListOfADV) ADV(adv_list: adv),
            ],
          ),
        ),
      ),
    );
  }
}
