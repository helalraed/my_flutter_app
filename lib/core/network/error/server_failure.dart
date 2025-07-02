
class ServerFailure {
  final int statusCode;
  final Map<String, dynamic> errors;
  ServerFailure({required this.statusCode, required this.errors});
}
