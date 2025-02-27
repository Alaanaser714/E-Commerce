import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path, required Map<String, String> data}) async {
    await firestore.collection(path).add(data);
  }
}
