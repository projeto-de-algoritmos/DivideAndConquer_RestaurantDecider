import 'package:decider_app/components/restaurant_card.dart';
import 'package:decider_app/restaurants.dart';
import 'package:flutter/material.dart';

class ResultController {
  List<Widget> finishResult(Restaurants restaurants) {
    List<Widget> result = [];
    int index = 0;
    int lastScore = 0;

    for (var element in restaurants.restaurants.reversed) {
      if (element["score"] != lastScore) {
        index++;
        lastScore = element["score"];
      }
      result.add(RestaurantCard(element: element, index: index));
    }
    return result;
  }
}
