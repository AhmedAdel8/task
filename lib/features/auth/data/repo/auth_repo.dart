import 'package:task/core/cache_helper/cache_helper.dart';
import 'package:task/core/cache_helper/cache_values.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/networking/api_execute.dart';
import 'package:task/core/networking/api_result.dart';
import 'package:task/core/networking/api_services.dart';
import 'package:task/core/networking/dio_factory.dart';
import 'package:task/features/auth/data/models/login_request_model.dart';
import 'package:task/features/auth/data/models/login_response_model.dart';

class AuthRepository {
  final ApiServices _apiService;

  AuthRepository(this._apiService);

  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel request,
  }) async {
    return executeApi(
      () => _apiService.login(loginRequestModel: request),
      onSuccess: (data) async {
        DioFactory.setAuthToken(data.token);
        await saveCaches(data);
      },
    );
  }
}

/// save caches
Future<void> saveCaches(LoginResponseModel model) async {
  await CacheHelper.saveSecuredString(
    key: CacheKeys.userToken,
    value: model.token,
  );
  await CacheHelper.saveData(
    key: CacheKeys.userName,
    value: model.employee.name ?? '',
  );
  await CacheHelper.saveData(
    key: CacheKeys.userEmail,
    value: model.employee.email ?? '',
  );
  await CacheHelper.saveData(key: CacheKeys.role, value: model.employee.roleId);
  await CacheHelper.saveData(key: CacheKeys.userid, value: model.employee.id);

  await CacheHelper.saveData(
    key: CacheKeys.userImage,
    value: model.employee.image ?? '',
  );
  await CacheHelper.saveData(
    key: CacheKeys.userPhone,
    value: model.employee.phone ?? '',
  );
  await CacheHelper.saveData(key: CacheKeys.role, value: model.employee.roleId);
  isAdmin = CacheHelper.getData(key: CacheKeys.role) != 1;
  userToken = await CacheHelper.getSecuredString(key: CacheKeys.userToken);
}
