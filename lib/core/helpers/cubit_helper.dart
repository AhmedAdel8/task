import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/networking/api_error_model.dart';
import 'package:task/core/networking/api_result.dart';
import 'package:task/core/utilies/easy_loading.dart';

mixin CubitApiHandler<S> on Cubit<S> {
  Future<void> handleApiCall<T>({
    required S loadingState,
    required Future<ApiResult<T>> Function() apiCall,
    required void Function(T data) onSuccess,
    required S Function(ApiErrorModel) errorState,
    required S timeoutState,
    bool withLoading = false,
  }) async {
    if (withLoading) showLoading();
    emit(loadingState);

    final result = await apiCall();

    result.when(
      success: (data) {
        if (withLoading) hideLoading();
        onSuccess(data);
      },
      failure: (failure) {
        if (withLoading) hideLoading();
        emit(errorState(failure));
      },
      timeout: () {
        if (withLoading) hideLoading();
        emit(timeoutState);
      },
    );
  }
}
