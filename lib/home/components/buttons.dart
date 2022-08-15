import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        MaterialButton(
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ],
    );
  }
}
