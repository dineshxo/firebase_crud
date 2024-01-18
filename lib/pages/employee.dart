import 'package:firebase_crud/components/constraints.dart';
import 'package:firebase_crud/firebase_services/database.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
                  controller: nameController,
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
                  controller: ageController,
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
                  controller: locationController,
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
                  onPressed: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> employeeInfoMap = {
                      'Name': nameController.text,
                      'Age': ageController.text,
                      'Location': locationController.text,
                      'Id': id,
                    };

                    await DatabaseMethods()
                        .addEmpInfo(employeeInfoMap, id)
                        .then((value) => Fluttertoast.showToast(
                            msg: "Employee info added successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0));
                  },
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
