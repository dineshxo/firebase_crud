import 'package:firebase_crud/components/round_btn.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Firebase',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 149, 0)),
              ),
              Text(
                'CRUD',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )
            ],
          )),
      body: RoundButton(
        onTap: () {
          print('pressed');
          Navigator.pushNamed(context, '/addEmp');
        },
      ),
    );
  }
}
