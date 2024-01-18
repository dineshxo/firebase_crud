import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addEmpInfo(Map<String, dynamic> EmployeeInfoMap, String id) async {
    return FirebaseFirestore.instance
        .collection('Employee')
        .doc(id)
        .set(EmployeeInfoMap);
  }
}
