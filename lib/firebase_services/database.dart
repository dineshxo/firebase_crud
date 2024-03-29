import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addEmpInfo(Map<String, dynamic> EmployeeInfoMap, String id) async {
    return FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .set(EmployeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmpInfo() async {
    try {
      print('done');
      return FirebaseFirestore.instance.collection('Employee').snapshots();
    } catch (e) {
      print('Error fetching data: $e');
      return Stream<
          QuerySnapshot>.empty(); // Return an empty stream in case of an error
    }
  }

  Future updateEmp(String id, Map<String, dynamic> updateEmpInfo) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .update(updateEmpInfo);
  }

  Future deleteEmp(String id) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .delete();
  }
}
