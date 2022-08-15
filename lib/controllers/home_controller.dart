import 'package:decider_app/restaurants.dart';
import 'package:flutter/material.dart';

class HomeController {
  TextEditingController name = TextEditingController();
  Restaurants restaurants = Restaurants();
  ValueNotifier<bool> buttonClicked = ValueNotifier(false);

  Map<String, List> definedOpinions = {};

  List<int> score = [0, 0, 0, 0, 0];

  void addOpinion() {
    List<int> idOpinions = [];

    for (var element in restaurants.opinions) {
      idOpinions.add(element["id"]);
    }
    definedOpinions[name.text] = idOpinions;
    restaurants.opinions = restaurants.restaurants;
    name.text = "";
    print(definedOpinions);
  }
}
