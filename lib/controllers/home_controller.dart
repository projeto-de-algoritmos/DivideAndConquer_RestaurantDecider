import 'package:decider_app/restaurants.dart';
import 'package:flutter/material.dart';

class HomeController {
  TextEditingController name = TextEditingController();
  Restaurants restaurants = Restaurants();
  ValueNotifier<bool> buttonClicked = ValueNotifier(false);

  Map<String, List<int>> definedOpinions = {};

  void addOpinion() {
    List<int> idOpinions = [];

    for (var element in restaurants.opinions) {
      idOpinions.add(element["id"]);
    }
    definedOpinions[name.text] = idOpinions;
    restaurants.opinions = [];
    restaurants.opinions.addAll(restaurants.restaurants);
    name.text = "";
    updatePoints(idOpinions);
  }

  void updatePoints(List<int> idOpinions) {
    for (int index = 0; index < 5; index++) {
      switch (index) {
        case 0:
          restaurants.restaurants[idOpinions[index]]["score"] += 25;
          break;
        case 1:
          restaurants.restaurants[idOpinions[index]]["score"] += 18;
          break;
        case 2:
          restaurants.restaurants[idOpinions[index]]["score"] += 15;
          break;
        case 3:
          restaurants.restaurants[idOpinions[index]]["score"] += 10;
          break;
        case 4:
          restaurants.restaurants[idOpinions[index]]["score"] += 8;
          break;
        default:
      }
    }
  }

  void finish() {
    restaurants.restaurants.sort((a, b) => a["score"].compareTo(b["score"]));
  }
}
