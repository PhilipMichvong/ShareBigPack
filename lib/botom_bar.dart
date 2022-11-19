import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharebigpack2/advertisementPage.dart';
import 'package:sharebigpack2/screens/ListOfADV.dart';
import 'package:sharebigpack2/screens/ProfileInfo.dart';
import 'package:sharebigpack2/screens/ShareRecipe.dart';

class botom_navigation extends StatefulWidget {
  const botom_navigation({super.key});

  @override
  State<botom_navigation> createState() => _botom_navigationState();
}

class _botom_navigationState extends State<botom_navigation> {
  int s_index = 0;
  static final List<Widget> screens = <Widget>[
    AdvPage(),
    ListOFADV(),
    ShareRecipe(),
    Profile_info(),
  ];
  void on_selected_index_change(int index) {
    setState(() {
      s_index = index;
    });
  }

  final items = <Widget>[
    Icon(
      Icons.home,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Icon(
      Icons.list,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Icon(
      Icons.receipt,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Icon(
      Icons.man,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[s_index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        items: items,
        backgroundColor: Color.fromARGB(255, 236, 234, 234),
        index: s_index,
        onTap: on_selected_index_change,
      ),
    );
  }
}
