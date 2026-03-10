import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task/core/networking/failures.dart';

import 'api_result.dart';

Future<ApiResult<T>> executeApi<T>(
  Future<T> Function() apiCall, {
  FutureOr<void> Function(T)? onSuccess, // ✅ يقبل Future أو Sync
}) async {
  try {
    final result = await apiCall();

    if (onSuccess != null) {
      await onSuccess(result);
    }

    return ApiResult.success(result);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const ApiResult.timeout();
    }
    return ApiResult.failure(ApiErrorHandler.handle(e));
  } catch (e, stackTrace) {
    log('Error: $e\nStackTrace: $stackTrace');
    return ApiResult.failure(ApiErrorHandler.handle(e));
  }
}
