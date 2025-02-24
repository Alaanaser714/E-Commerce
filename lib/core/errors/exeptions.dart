class ClientExeption implements Exception {
  final String message;

  ClientExeption({required this.message});
  @override
  String toString() {
    return message.toString();
  }
}
