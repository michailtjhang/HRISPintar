import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String Id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(Id)
        .set(employeeInfoMap);
  }
}
