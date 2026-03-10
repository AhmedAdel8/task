import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task/core/cache_helper/cache_helper.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/functions/flutter_toast.dart';
import 'package:task/core/helpers/extensions.dart';
import 'package:task/core/networking/dio_factory.dart';
import 'package:task/core/routing/routes.dart';

import 'api_error_model.dart';

// class ApiErrorHandler {
//   static ApiErrorModel handle(dynamic error) {
//     if (error is DioException) {
//       switch (error.type) {
//         case DioExceptionType.connectionError:
//           return ApiErrorModel(errors: "Connection to server failed");
//         case DioExceptionType.cancel:
//           return ApiErrorModel(errors: "Request to the server was cancelled");
//         case DioExceptionType.connectionTimeout:
//           return ApiErrorModel(errors: "Connection timeout with the server");
//         case DioExceptionType.unknown:
//           return ApiErrorModel(
//             errors:
//                 "Connection to the server failed due to internet connection",
//           );
//         case DioExceptionType.receiveTimeout:
//           return ApiErrorModel(
//             errors: "Receive timeout in connection with the server",
//           );
//         case DioExceptionType.badResponse:
//           // print(error.response?.statusCode == 401);
//           if (error.response?.statusCode == 401) {
//             userToken = null;
//             CacheHelper.clearAllSecuredData();
//             DioFactory.clearAuthToken();
//             navigatorKey.currentContext?.pushNamedAndRemoveUntil(
//               Routes.loginScreen,
//             );
//             customToast(msg: "sessionExpired".tr(), color: Colors.red);
//           }

//           return _handleError(error.response?.data);
//         case DioExceptionType.sendTimeout:
//           return ApiErrorModel(
//             errors: "Send timeout in connection with the server",
//           );
//         default:
//           return ApiErrorModel(errors: "somethingWentWrong".tr());
//       }
//     } else {
//       return ApiErrorModel(errors: "Unknown error occurred");
//     }
//   }
// }

// ApiErrorModel _handleError(dynamic data) {
//   return ApiErrorModel(errors: data['error'] ?? "Unknown error occurred");
// }

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(errors: "error_connection_failed".tr());

        case DioExceptionType.cancel:
          return ApiErrorModel(errors: "error_request_cancelled".tr());

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(errors: "error_connection_timeout".tr());

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(errors: "error_receive_timeout".tr());

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(errors: "error_send_timeout".tr());

        case DioExceptionType.unknown:
          return ApiErrorModel(errors: "server_error".tr());

        case DioExceptionType.badResponse:
          if (error.response?.statusCode == 401) {
            _handleUnauthorized();
            return ApiErrorModel(errors: "error_session_expired".tr());
          }

          return _handleError(error.response);

        default:
          return ApiErrorModel(errors: "error_something_went_wrong".tr());
      }
    } else {
      return ApiErrorModel(errors: "error_unknown".tr());
    }
  }

  static void _handleUnauthorized() {
    userToken = null;
    CacheHelper.clearAllSecuredData();
    DioFactory.clearAuthToken();

    navigatorKey.currentContext?.pushNamedAndRemoveUntil(Routes.loginScreen);

    customToast(msg: "error_session_expired".tr(), color: Colors.red);
  }
}

ApiErrorModel _handleError(Response? response) {
  if (response == null) {
    return ApiErrorModel(errors: "error_server_issue".tr());
  }

  final data = response.data;
  // Handle different backend formats safely
  if (data is Map<String, dynamic>) {
    if (data['message'] != null) {
      return ApiErrorModel(errors: data['message']);
    }

    if (data['error'] != null) {
      return ApiErrorModel(errors: data['error']);
    }

    if (data['errors'] is List) {
      return ApiErrorModel(errors: (data['errors'] as List).join('\n'));
    }
  }

  return ApiErrorModel(errors: "error_server_issue".tr());
}
