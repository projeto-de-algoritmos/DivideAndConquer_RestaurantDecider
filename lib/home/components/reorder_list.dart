import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../variables.dart';

class ReorderAppList extends StatefulWidget {
  const ReorderAppList({Key? key}) : super(key: key);

  @override
  State<ReorderAppList> createState() => _ReorderAppListState();
}

class _ReorderAppListState extends State<ReorderAppList> {
  Restaurants restaurants = Restaurants();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.52,
      margin: const EdgeInsets.only(top: 15),
      child: ReorderableListView(
        children: [
          for (int index = 0; index < restaurants.restaurants.length; index++)
            Container(
              key: Key(restaurants.restaurants[index]["id"].toString()),
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
                          foregroundImage: AssetImage(
                              restaurants.restaurants[index]["image"]),
                        ),
                        const SizedBox(width: 10),
                        Text(restaurants.restaurants[index]["name"]),
                      ],
                    ),
                    SizedBox(
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = restaurants.restaurants.removeAt(oldIndex);
            restaurants.restaurants.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
