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
    updatePoints(idOpinions);
    print(definedOpinions);
    print(score);
  }

  void updatePoints(List<int> idOpinions) {
    for (int index = 0; index < 5; index++) {
      switch (index) {
        case 0:
          score[idOpinions[index]] += 25;
          break;
        case 1:
          score[idOpinions[index]] += 18;
          break;
        case 2:
          score[idOpinions[index]] += 15;
          break;
        case 3:
          score[idOpinions[index]] += 10;
          break;
        case 4:
          score[idOpinions[index]] += 8;
          break;
        default:
      }
    }
  }
}
