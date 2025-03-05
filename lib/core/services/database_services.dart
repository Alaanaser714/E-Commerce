abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<dynamic> getData({
    String? docId,
    required String path,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({required String docId, required String path});
}
