
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../error/server_failure.dart';
import '../error/success.dart';

class NetworkUtils {
  Future<bool> isConnected() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Map<String, String> makeJsonHeaders({bool withAuth = false, String? apiKey}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (apiKey != null) {
      headers['x-api-key'] = apiKey;
    }
    return headers;
  }

  Map<String, String> makeHeaders({bool withAuth = false, String? apiKey}) {
    final headers = <String, String>{};
    if (apiKey != null) {
      headers['x-api-key'] = apiKey;
    }
    return headers;
  }

  Either<ServerFailure, Success> responseHandling(Response response) {
    return Right(Success(data: response.data));
  }

  Either<ServerFailure, Success> handleDioException(DioException e, Function retry) {
    return Left(ServerFailure(statusCode: e.response?.statusCode ?? 0, errors: {'message': e.message}));
  }
}
