import 'package:decider_app/home/components/app_bar.dart';
import 'package:decider_app/home/components/buttons.dart';
import 'package:decider_app/home/components/reorder_list.dart';
import 'package:decider_app/home/components/text_field.dart';
import 'package:decider_app/variables.dart';
import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(formKey: _formKey),
              const Text(
                "Ordene as suas preferências!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const ReorderAppList(),
              CustomButtons(formKey: _formKey)
            ],
          ),
        ),
      ),
    );
  }
}
