import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  // Create Employee Details
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(Id)
        .set(employeeInfoMap);
  }

  // Read Employee Details
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  // Update Employee Details
  Future updateEmployeeDetails(
      String Id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(Id)
        .update(updateInfo);}

  // Delete Employee Details
  Future deleteEmployeeDetails(String Id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(Id)
        .delete();
  }
}
