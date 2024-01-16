import 'package:firebase_crud/components/constraints.dart';

import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Employee',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 149, 0)),
              ),
              Text(
                'Form',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: kInputFieldDeco,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  decoration: inputDecoration,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Age',
                style: kInputFieldDeco,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  decoration: inputDecoration,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Location',
                style: kInputFieldDeco,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60.0,
                child: TextField(
                  decoration: inputDecoration,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 60.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
