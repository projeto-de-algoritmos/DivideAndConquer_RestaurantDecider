import 'package:decider_app/variables.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  Restaurants restaurants = Restaurants();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int index = 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          elevation: 10.0,
          title: Text("DECIDER!")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Digite o seu nome!",
                        labelStyle: TextStyle(color: Colors.black),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.purpleAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.purpleAccent),
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                      validator: (value) {
                        if (value == "") return "Adicione o seu nome";
                        return null;
                      }),
                ),
              ),
              const Text(
                "Ordene as suas preferências!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                height: size.height * 0.52,
                margin: EdgeInsets.only(top: 15),
                child: ReorderableListView(
                  children: [
                    for (int index = 0;
                        index < restaurants.restaurants.length;
                        index++)
                      Container(
                        key: Key(
                            restaurants.restaurants[index]["id"].toString()),
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
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 35),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    foregroundImage: AssetImage(restaurants
                                        .restaurants[index]["image"]),
                                  ),
                                  SizedBox(width: 10),
                                  Text(restaurants.restaurants[index]["name"]),
                                ],
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Opinião processada!',
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.greenAccent,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        "Adicionar pessoa!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        "Finalizar!",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
