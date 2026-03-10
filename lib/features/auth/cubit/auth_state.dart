part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loginLoading() = AuthStateLoginLoading;

  const factory AuthState.loginSuccess() = AuthStateLoginSuccess;

  const factory AuthState.loginError(ApiErrorModel failure) =
      AuthStateLoginError;

  const factory AuthState.timeOut({Future<void> Function()? function}) =
      TimeoutFailureAuth;

  const factory AuthState.authStateChangePasswordVisibility({
    required bool isPasword,
  }) = AuthStateChangePasswordVisibility;
}
