
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import './constant/endpoints.dart';
import './error/server_failure.dart';
import './error/success.dart';
import './util/network_utils.dart';
import './util/network_failuer_dialog.dart';
import '../../localization/app_translations.dart';

class NetworkBase {
  NetworkBase._();
  static NetworkBase? _instance;
  factory NetworkBase() => _instance ??= NetworkBase._();

  final _baseUrl = AppEndpoints.baseUrl;
  final NetworkUtils _networkUtils = NetworkUtils();
  final Dio _dio = Dio();

  Future<Either<ServerFailure, Success>> _handleNetworkFailure() async {
    final shouldRetry = await NetworkFailureDialog.showNoInternetDialog();
    if (shouldRetry) {
      return Right(Success(data: null));
    }
    return Left(ServerFailure(
        statusCode: 0,
        errors: {'message': AppTranslations.noInternetConnection}));
  }

  Future<Either<ServerFailure, Success>> get({
    required String api,
    Map<String, dynamic>? params,
    bool withAuth = false,
    String? apiKey,
    String? baseUrl,
  }) async {
    final headers =
        _networkUtils.makeHeaders(withAuth: withAuth, apiKey: apiKey);

    while (true) {
      if (!await _networkUtils.isConnected()) {
        final result = await _handleNetworkFailure();
        if (result.isRight()) continue;
        return result;
      }

      try {
        final response = await _dio.get(
          (baseUrl ?? _baseUrl) + api,
          queryParameters: params,
          options: Options(headers: headers),
        );
        return _networkUtils.responseHandling(response);
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.connectionError) {
          final result = await _handleNetworkFailure();
          if (result.isRight()) continue;
          return result;
        }
        return _networkUtils.handleDioException(
            e,
            () => get(
                  api: api,
                  params: params,
                  withAuth: withAuth,
                  apiKey: apiKey,
                  baseUrl: baseUrl,
                ));
      } catch (e) {
        log("Network errors ${e.toString()}");
        return Left(ServerFailure(
            statusCode: 0, errors: {'message': e.toString()}));
      }
    }
  }
}
