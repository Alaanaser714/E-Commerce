import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, String> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String docId, required String path}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }
}
