import 'package:decider_app/home/components/app_bar.dart';
import 'package:decider_app/home/components/buttons.dart';
import 'package:decider_app/home/components/reorder_list.dart';
import 'package:decider_app/home/components/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  HomeController controller = HomeController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: controller.buttonClicked,
          builder: ((context, value, child) => SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      formKey: _formKey,
                      controller: controller,
                    ),
                    const Text(
                      "Ordene as suas preferências!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    ReorderAppList(
                      controller: controller,
                    ),
                    CustomButtons(
                      formKey: _formKey,
                      controller: controller,
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
