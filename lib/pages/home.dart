import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/components/round_btn.dart';
import 'package:firebase_crud/firebase_services/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmpInfo();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allEmpDetails() {
    return StreamBuilder(
      stream: EmployeeStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.data.docs == null) {
          // Display a loading indicator or some other UI when data is not available yet
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ' + ds['Name'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Age: ' + ds['Age'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Location: ' + ds['Location'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

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
        body: Stack(children: [
          Column(
            children: [
              allEmpDetails(),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: RoundButton(
              onTap: () {
                Navigator.pushNamed(context, '/addEmp');
              },
            ),
          ),
        ]));
  }
}
