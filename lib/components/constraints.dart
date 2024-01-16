import 'package:flutter/material.dart';

InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(
      color: Colors.orange, // Set your desired focused border color
      width: 2.0, // Set the width of the focused border
    ),
  ),
);

const kInputFieldDeco =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue);
