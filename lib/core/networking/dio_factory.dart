import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/cache_helper/cache_helper.dart';
import 'package:task/core/cache_helper/cache_values.dart';
import 'package:task/core/networking/end_points.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
        ),
      );
      if (kDebugMode) {
        _addDioInterceptor();
      }

      await _addDioHeaders();
    }

    return _dio!;
  }

  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static Future<void> _addDioHeaders() async {
    final token = await CacheHelper.getSecuredString(key: CacheKeys.userToken);

    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    if (token != null && token.isNotEmpty) {
      _dio?.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static void setAuthToken(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearAuthToken() {
    _dio?.options.headers.remove('Authorization');
  }
}
