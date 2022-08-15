import 'package:decider_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class ReorderAppList extends StatefulWidget {
  const ReorderAppList({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<ReorderAppList> createState() => _ReorderAppListState();
}

class _ReorderAppListState extends State<ReorderAppList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.52,
      margin: const EdgeInsets.only(top: 15),
      child: ReorderableListView(
        children: [
          for (int index = 0;
              index < widget.controller.restaurants.opinions.length;
              index++)
            Container(
              key: Key(widget.controller.restaurants.opinions[index]["id"]
                  .toString()),
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
                          foregroundImage: AssetImage(widget
                              .controller.restaurants.opinions[index]["image"]),
                        ),
                        const SizedBox(width: 10),
                        Text(widget.controller.restaurants.opinions[index]
                            ["name"]),
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
            final item =
                widget.controller.restaurants.opinions.removeAt(oldIndex);
            widget.controller.restaurants.opinions.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
