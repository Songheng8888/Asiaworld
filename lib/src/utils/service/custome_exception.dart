class CustomException implements Exception {
  final String message;

  CustomException({this.message = 'Unknown error occurred. '});
  static generalException({String message = "Unexpected error occured"}) {
    // error from internal server
    throw Exception(message);
  }
}
