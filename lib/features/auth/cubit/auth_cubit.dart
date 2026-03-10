import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/helpers/cubit_helper.dart';
import 'package:task/core/networking/api_error_model.dart';
import 'package:task/features/auth/data/models/login_request_model.dart';
import 'package:task/features/auth/data/repo/auth_repo.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with CubitApiHandler {
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  final AuthRepository _authRepository;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    await handleApiCall(
      loadingState: const AuthState.loginLoading(),
      apiCall: () => _authRepository.login(
        request: LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      ),
      onSuccess: (userModel) async {
        emit(const AuthState.loginSuccess());
      },
      errorState: AuthState.loginError,
      timeoutState: const AuthState.timeOut(),
      withLoading: true,
    );
  }

  bool isPasswordObscured = true;
  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(
      AuthState.authStateChangePasswordVisibility(
        isPasword: isPasswordObscured,
      ),
    );
  }
}
