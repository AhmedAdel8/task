part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;


  const factory AuthState.authStateChangePasswordVisibility({
    required bool isPasword,
  }) = AuthStateChangePasswordVisibility;
  const factory AuthState.authStateChangeRePasswordVisibility({
    required bool isPasword,
  }) = AuthStateChangeRePasswordVisibility;

  const factory AuthState.showSignUp() = AuthStateShowSignUp;
  const factory AuthState.signUpError(String message) = AuthStateSignUpError;
  const factory AuthState.signUpSuccess(String message) = AuthStateSignUpSuccess;
}
