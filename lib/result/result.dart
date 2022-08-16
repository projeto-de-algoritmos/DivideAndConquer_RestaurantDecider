// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:decider_app/controllers/result_controller.dart';
import 'package:decider_app/home/components/app_bar.dart';
import 'package:decider_app/home/home.dart';
import 'package:decider_app/restaurants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {Key? key, required this.restaurants, required this.definedOpinions})
      : super(key: key);

  final Restaurants restaurants;
  final ResultController controller = ResultController();
  final Map<String, List<int>> definedOpinions;

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = controller.finishResult(restaurants);
    List<String> names =
        controller.compareOpinions(restaurants, definedOpinions);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 45)),
              Center(
                child: const Text(
                  "Resultado final!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              ...listWidget,
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pessoa com mais inversão: ${names[0]}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pessoa com menos inversão: ${names[1]}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomeList())));
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Realizar nova decisão!",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
