import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // Reference to the user's collection
  CollectionReference get userCollection => FirebaseFirestore.instance.collection('Users').doc(uid).collection('Employee');

  // Create Employee Details
  Future<DocumentReference> addEmployeeDetails(Map<String, dynamic> employeeInfoMap) async {
    return await userCollection.add(employeeInfoMap);
  }

  // Read Employee Details
  Stream<QuerySnapshot> getEmployeeDetails() {
    return userCollection.snapshots();
  }

  // Update Employee Details
  Future<void> updateEmployeeDetails(String docId, Map<String, dynamic> updateInfo) async {
    return await userCollection.doc(docId).update(updateInfo);
  }

  // Delete Employee Details
  Future<void> deleteEmployeeDetails(String docId) async {
    return await userCollection.doc(docId).delete();
  }
}
