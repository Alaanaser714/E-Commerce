abstract class DatabaseServices {
  Future<void> addData(
      {required String path, required Map<String, String> data});
  Future<Map<String, dynamic>> getData(
      {required String docId, required String path});
}
