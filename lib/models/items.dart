import 'package:asignment_2/models/products.dart';

import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  final List<Products> _items = [
    Products(
        name: "Nike SB X Supreme Dunk Low Pro",
        picture: 'assets/panda.png',
        description:
            'Supreme’s take on the skateboardified Dunk Low, \nA homage to the Air Jordan 3’s elephant print, \nhelped give the young label the juice and hype \nit’s been synonymous with ever since\n\nRelease Date: September 2002',
        price: 2002),
    Products(
        name: 'Allen Iverson X Reebok Answer 1',
        picture: 'assets/rbk.png',
        description:
            'Debuted when Iverson was the reigning Rookie\nof the Year and an international icon on the rise.\n\nRelease Date: November 1997',
        price: 1997),
    Products(
        name: 'Nike X Corteiz Air Max 95',
        picture: 'assets/crtz.png',
        description:
            'A Nike collaboration with a UK brand\nCortiez that was founded by a Londoner, Clint491\n\nRelease Date: July 2023 ',
        price: 2023),
    Products(
        name: 'Nike x Cactus Plant Flea Market Air VaporMax 2019',
        picture: 'assets/cactus.png',
        description:
            'Designed by Cythia Lu in 2015 in her apartment in Brooklyn, New York\n\nRelease Date: May 2019',
        price: 2019),
    Products(
        name: 'Air Jordan 1 "Chicago" Baseball Cleats',
        picture: 'assets/chicago.png',
        description:
            'Iconic and offers a comfortable, durable upper, \nresponsive cushioning and metal cleats for exceptional \non-field traction.\n\nRelease Date: November 2019',
        price: 2019),
  ];

  //getter
  List<Products> get items => _items;

  //wish list
  List<Products> _bag = [];

  //getter
  List<Products> get bag => _bag;

  //add to bag
  add(Products product) {
    _bag.add(product);
    notifyListeners();
  }

  //remove from bag
  remove(Products product) {
    _bag.remove(product);
    notifyListeners();
  }
}
