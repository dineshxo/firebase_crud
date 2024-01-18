import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.onTap, required this.icon});

  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onTap();
      },
      shape: const CircleBorder(),
      fillColor: Colors.blue,
      constraints: const BoxConstraints.tightFor(width: 60, height: 60),
      child: Icon(
        icon,
        size: 35,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
