import 'package:flutter/material.dart';

class ADVinfo {
  String? title;
  String? shop;
  String? User;
  String? Location;

  ADVinfo({
    required this.title,
    required this.User,
    required this.Location,
    required this.shop,
  });

  static List<ADVinfo> ADV_list() {
    return [
      ADVinfo(
          title: "giga okazja",
          User: "maciej2000",
          Location: "Okopowa 12 Warszawa",
          shop: "lidl"),
      ADVinfo(
          title: "Miesko w promocji",
          User: "MieskoLubdza",
          Location: "Okopowa 12 Krakow",
          shop: "lidl"),
      ADVinfo(
          title: "12+12",
          User: "maciej2000",
          Location: "Dywzjony 303 Wroclaw",
          shop: "Biedronka"),
    ];
  }
}
