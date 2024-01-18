import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      shape: const CircleBorder(),
      fillColor: Colors.blue,
      constraints: const BoxConstraints.tightFor(width: 60, height: 60),
      child: const Icon(
        Icons.add,
        size: 35,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
