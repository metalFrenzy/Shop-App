class HtppException implements Exception {
  final String message;

  HtppException(this.message);

  @override
  String toString() {
    return message;
  }
}
