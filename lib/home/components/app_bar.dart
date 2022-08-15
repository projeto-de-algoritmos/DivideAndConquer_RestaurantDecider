import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purpleAccent,
      elevation: 10.0,
      title: const Text("DECIDER!"),
    );
  }

  @override
  Widget get child => const Text("DECIDER");

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
