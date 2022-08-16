import 'package:decider_app/components/restaurant_card.dart';
import 'package:decider_app/restaurants.dart';
import 'package:flutter/material.dart';

class ResultController {
  Map<String, int> newIndexes = {};

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

  void createResultList(Restaurants restaurants) {
    int index = 0;
    List<int> resultList = [];
    for (var element in restaurants.restaurants.reversed) {
      newIndexes[element["id"].toString()] = index;
      resultList.add(element["id"]);
      index++;
    }
    print(resultList);
  }

  List<String> compareOpinions(
      Restaurants restaurants, Map<String, List<int>> definedOpinions) {
    int moreInversions = -50;
    int lessInversions = 50;
    String personMoreInversions = "";
    String personLessInversions = "";

    createResultList(restaurants);

    int inversions;

    definedOpinions.forEach((key, value) {
      List<int> newList = [];
      for (var element in value) {
        int? test = newIndexes[element.toString()];
        if (test != null) newList.add(test);
      }
      print("$key - $newList");
      inversions = countInversions(newList);
      if (inversions > moreInversions) {
        moreInversions = inversions;
        personMoreInversions = key;
      } else if (inversions == moreInversions) {
        personMoreInversions += " e $key";
      }

      if (inversions < lessInversions) {
        lessInversions = inversions;
        personLessInversions = key;
      } else if (inversions == lessInversions) {
        personLessInversions += " e $key";
      }
    });

    return [personMoreInversions, personLessInversions];
  }

  int countInversions(List<int> v) {
    int inversoes = 0;

    if (v.length == 1) return 0;

    List<int> ref1 = [];
    List<int> ref2 = [];

    for (int i = 0; i < v.length / 2; i++) {
      ref1.add(v[i]);
    }
    for (int i = v.length ~/ 2; i < v.length; i++) {
      ref2.add(v[i]);
    }

    inversoes += countInversions(ref1);
    inversoes += countInversions(ref2);

    ref1.add(10000);
    ref2.add(10000);

    int ini1 = 0, ini2 = 0;

    for (int i = 0; i < v.length; i++) {
      if (ref1[ini1] <= ref2[ini2]) {
        v[i] = ref1[ini1];
        ini1++;
      } else {
        v[i] = ref2[ini2];
        ini2++;
        inversoes += ref1.length - ini1 - 1;
      }
    }
    return inversoes;
  }
}
