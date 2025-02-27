abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, String> data,
    String? docId,
  });
  Future<Map<String, dynamic>> getData(
      {required String docId, required String path});

  Future<bool> checkIfDataExists({required String docId, required String path});
}
