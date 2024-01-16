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
      fillColor: Colors.orange,
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      child: const Icon(
        Icons.add,
        size: 30,
        color: Colors.blue,
      ),
    );
  }
}
