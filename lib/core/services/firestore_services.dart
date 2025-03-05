import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {String? docId,
      required String path,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      var data = await firestore.collection(path).doc(docId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var decending = query['decending'];
          data.orderBy(orderByField, descending: decending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String docId, required String path}) async {
    var data = await firestore.collection(path).doc(docId).get();
    return data.exists;
  }
}
