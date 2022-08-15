import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({Key? key, required this.formKey})
      : super(key: key);

  final GlobalKey<FormState> formKey;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: Form(
        key: widget.formKey,
        child: TextFormField(
            decoration: const InputDecoration(
              labelText: "Digite o seu nome!",
              labelStyle: TextStyle(color: Colors.black),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.purpleAccent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.purpleAccent),
              ),
              contentPadding: EdgeInsets.only(left: 20),
            ),
            validator: (value) {
              if (value == "") return "Adicione o seu nome";
              return null;
            }),
      ),
    );
  }
}
