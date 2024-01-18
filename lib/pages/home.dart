import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/components/constraints.dart';
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

  getOnTheLoad() async {
    EmployeeStream = await DatabaseMethods().getEmpInfo();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
                    Row(
                      children: [
                        Text(
                          'Name: ' + ds['Name'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            nameController.text = ds['Name'];
                            ageController.text = ds['Age'];
                            locationController.text = ds['Location'];
                            editEmp(ds['Id']);
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await DatabaseMethods().deleteEmp(ds['Id']);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Age: ' + ds['Age'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
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
              icon: Icons.add,
              onTap: () {
                Navigator.pushNamed(context, '/addEmp');
              },
            ),
          ),
        ]));
  }

  Future editEmp(String id) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 149, 0)),
                        ),
                        Text(
                          'Employee',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RoundButton(
                                onTap: () async {
                                  Map<String, dynamic> updateEmpInfo = {
                                    'Name': nameController.text,
                                    'Age': ageController.text,
                                    'Location': locationController.text,
                                    'Id': id,
                                  };

                                  try {
                                    await DatabaseMethods()
                                        .updateEmp(id, updateEmpInfo);
                                    Navigator.pop(context);
                                  } catch (err) {
                                    print(err.toString());
                                  }
                                },
                                icon: Icons.check),
                            const SizedBox(
                              width: 15,
                            ),
                            RoundButton(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                icon: Icons.close)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
