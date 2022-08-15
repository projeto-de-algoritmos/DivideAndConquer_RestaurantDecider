import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key, required this.element, required this.index})
      : super(key: key);

  final Map<dynamic, dynamic> element;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(element["id"].toString()),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.15),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(0, 4),
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.15))
          ]),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage(element["image"]),
                ),
                const SizedBox(width: 10),
                Text(element["name"]),
              ],
            ),
            SizedBox(
              child: Center(
                child: Text(
                  (index).toString(),
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
