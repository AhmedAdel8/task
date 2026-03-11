import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/core/helpers/cubit_helper.dart';
import 'package:task/core/networking/api_error_model.dart';
import 'package:task/features/auth/data/repo/auth_repo.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with CubitApiHandler {
  AuthCubit(this.authRepository) : super(const AuthState.initial());
  final AuthRepository authRepository;


  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpRePasswordController =
      TextEditingController();

  bool isPasswordObscured = true;
  bool isRePasswordObscured = true;
  bool showSignUp = false;

  void onContinueWithOasis() {
    showSignUp = true;
    emit(const AuthState.showSignUp());
  }

  void validateAndSignUp() {
    final email = signUpEmailController.text.trim();
    final pass = signUpPasswordController.text;
    final rePass = signUpRePasswordController.text;

    if (email.isEmpty || pass.isEmpty || rePass.isEmpty) {
      emit(const AuthState.signUpError("Please fill all fields."));
      return;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      emit(const AuthState.signUpError("Please enter a valid email address."));
      return;
    }
    if (pass != rePass) {
      emit(const AuthState.signUpError("Passwords did not match, try again."));
      return;
    }
    emit(const AuthState.signUpSuccess("All validations passed"));
  }

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(
      AuthState.authStateChangePasswordVisibility(
        isPasword: isPasswordObscured,
      ),
    );
  }

  void toggleRePasswordVisibility() {
    isRePasswordObscured = !isRePasswordObscured;
    emit(
      AuthState.authStateChangeRePasswordVisibility(
        isPasword: isRePasswordObscured,
      ),
    );
  }

  @override
  Future<void> close() {
    signUpEmailController.dispose();
    signUpPasswordController.dispose();
    signUpRePasswordController.dispose();

    return super.close();
  }
}
