// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AuthStateLoginLoading value)?  loginLoading,TResult Function( AuthStateLoginSuccess value)?  loginSuccess,TResult Function( AuthStateLoginError value)?  loginError,TResult Function( TimeoutFailureAuth value)?  timeOut,TResult Function( AuthStateChangePasswordVisibility value)?  authStateChangePasswordVisibility,TResult Function( AuthStateShowSignUp value)?  showSignUp,TResult Function( AuthStateSignUpError value)?  signUpError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthStateLoginLoading() when loginLoading != null:
return loginLoading(_that);case AuthStateLoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case AuthStateLoginError() when loginError != null:
return loginError(_that);case TimeoutFailureAuth() when timeOut != null:
return timeOut(_that);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp(_that);case AuthStateSignUpError() when signUpError != null:
return signUpError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AuthStateLoginLoading value)  loginLoading,required TResult Function( AuthStateLoginSuccess value)  loginSuccess,required TResult Function( AuthStateLoginError value)  loginError,required TResult Function( TimeoutFailureAuth value)  timeOut,required TResult Function( AuthStateChangePasswordVisibility value)  authStateChangePasswordVisibility,required TResult Function( AuthStateShowSignUp value)  showSignUp,required TResult Function( AuthStateSignUpError value)  signUpError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AuthStateLoginLoading():
return loginLoading(_that);case AuthStateLoginSuccess():
return loginSuccess(_that);case AuthStateLoginError():
return loginError(_that);case TimeoutFailureAuth():
return timeOut(_that);case AuthStateChangePasswordVisibility():
return authStateChangePasswordVisibility(_that);case AuthStateShowSignUp():
return showSignUp(_that);case AuthStateSignUpError():
return signUpError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AuthStateLoginLoading value)?  loginLoading,TResult? Function( AuthStateLoginSuccess value)?  loginSuccess,TResult? Function( AuthStateLoginError value)?  loginError,TResult? Function( TimeoutFailureAuth value)?  timeOut,TResult? Function( AuthStateChangePasswordVisibility value)?  authStateChangePasswordVisibility,TResult? Function( AuthStateShowSignUp value)?  showSignUp,TResult? Function( AuthStateSignUpError value)?  signUpError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthStateLoginLoading() when loginLoading != null:
return loginLoading(_that);case AuthStateLoginSuccess() when loginSuccess != null:
return loginSuccess(_that);case AuthStateLoginError() when loginError != null:
return loginError(_that);case TimeoutFailureAuth() when timeOut != null:
return timeOut(_that);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp(_that);case AuthStateSignUpError() when signUpError != null:
return signUpError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loginLoading,TResult Function()?  loginSuccess,TResult Function( ApiErrorModel failure)?  loginError,TResult Function( Future<void> Function()? function)?  timeOut,TResult Function( bool isPasword)?  authStateChangePasswordVisibility,TResult Function()?  showSignUp,TResult Function( String message)?  signUpError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthStateLoginLoading() when loginLoading != null:
return loginLoading();case AuthStateLoginSuccess() when loginSuccess != null:
return loginSuccess();case AuthStateLoginError() when loginError != null:
return loginError(_that.failure);case TimeoutFailureAuth() when timeOut != null:
return timeOut(_that.function);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp();case AuthStateSignUpError() when signUpError != null:
return signUpError(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loginLoading,required TResult Function()  loginSuccess,required TResult Function( ApiErrorModel failure)  loginError,required TResult Function( Future<void> Function()? function)  timeOut,required TResult Function( bool isPasword)  authStateChangePasswordVisibility,required TResult Function()  showSignUp,required TResult Function( String message)  signUpError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AuthStateLoginLoading():
return loginLoading();case AuthStateLoginSuccess():
return loginSuccess();case AuthStateLoginError():
return loginError(_that.failure);case TimeoutFailureAuth():
return timeOut(_that.function);case AuthStateChangePasswordVisibility():
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateShowSignUp():
return showSignUp();case AuthStateSignUpError():
return signUpError(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loginLoading,TResult? Function()?  loginSuccess,TResult? Function( ApiErrorModel failure)?  loginError,TResult? Function( Future<void> Function()? function)?  timeOut,TResult? Function( bool isPasword)?  authStateChangePasswordVisibility,TResult? Function()?  showSignUp,TResult? Function( String message)?  signUpError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthStateLoginLoading() when loginLoading != null:
return loginLoading();case AuthStateLoginSuccess() when loginSuccess != null:
return loginSuccess();case AuthStateLoginError() when loginError != null:
return loginError(_that.failure);case TimeoutFailureAuth() when timeOut != null:
return timeOut(_that.function);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp();case AuthStateSignUpError() when signUpError != null:
return signUpError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthStateLoginLoading implements AuthState {
  const AuthStateLoginLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateLoginLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginLoading()';
}


}




/// @nodoc


class AuthStateLoginSuccess implements AuthState {
  const AuthStateLoginSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateLoginSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loginSuccess()';
}


}




/// @nodoc


class AuthStateLoginError implements AuthState {
  const AuthStateLoginError(this.failure);
  

 final  ApiErrorModel failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateLoginErrorCopyWith<AuthStateLoginError> get copyWith => _$AuthStateLoginErrorCopyWithImpl<AuthStateLoginError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateLoginError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.loginError(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthStateLoginErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateLoginErrorCopyWith(AuthStateLoginError value, $Res Function(AuthStateLoginError) _then) = _$AuthStateLoginErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel failure
});




}
/// @nodoc
class _$AuthStateLoginErrorCopyWithImpl<$Res>
    implements $AuthStateLoginErrorCopyWith<$Res> {
  _$AuthStateLoginErrorCopyWithImpl(this._self, this._then);

  final AuthStateLoginError _self;
  final $Res Function(AuthStateLoginError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AuthStateLoginError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class TimeoutFailureAuth implements AuthState {
  const TimeoutFailureAuth({this.function});
  

 final  Future<void> Function()? function;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeoutFailureAuthCopyWith<TimeoutFailureAuth> get copyWith => _$TimeoutFailureAuthCopyWithImpl<TimeoutFailureAuth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutFailureAuth&&(identical(other.function, function) || other.function == function));
}


@override
int get hashCode => Object.hash(runtimeType,function);

@override
String toString() {
  return 'AuthState.timeOut(function: $function)';
}


}

/// @nodoc
abstract mixin class $TimeoutFailureAuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $TimeoutFailureAuthCopyWith(TimeoutFailureAuth value, $Res Function(TimeoutFailureAuth) _then) = _$TimeoutFailureAuthCopyWithImpl;
@useResult
$Res call({
 Future<void> Function()? function
});




}
/// @nodoc
class _$TimeoutFailureAuthCopyWithImpl<$Res>
    implements $TimeoutFailureAuthCopyWith<$Res> {
  _$TimeoutFailureAuthCopyWithImpl(this._self, this._then);

  final TimeoutFailureAuth _self;
  final $Res Function(TimeoutFailureAuth) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? function = freezed,}) {
  return _then(TimeoutFailureAuth(
function: freezed == function ? _self.function : function // ignore: cast_nullable_to_non_nullable
as Future<void> Function()?,
  ));
}


}

/// @nodoc


class AuthStateChangePasswordVisibility implements AuthState {
  const AuthStateChangePasswordVisibility({required this.isPasword});
  

 final  bool isPasword;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateChangePasswordVisibilityCopyWith<AuthStateChangePasswordVisibility> get copyWith => _$AuthStateChangePasswordVisibilityCopyWithImpl<AuthStateChangePasswordVisibility>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateChangePasswordVisibility&&(identical(other.isPasword, isPasword) || other.isPasword == isPasword));
}


@override
int get hashCode => Object.hash(runtimeType,isPasword);

@override
String toString() {
  return 'AuthState.authStateChangePasswordVisibility(isPasword: $isPasword)';
}


}

/// @nodoc
abstract mixin class $AuthStateChangePasswordVisibilityCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateChangePasswordVisibilityCopyWith(AuthStateChangePasswordVisibility value, $Res Function(AuthStateChangePasswordVisibility) _then) = _$AuthStateChangePasswordVisibilityCopyWithImpl;
@useResult
$Res call({
 bool isPasword
});




}
/// @nodoc
class _$AuthStateChangePasswordVisibilityCopyWithImpl<$Res>
    implements $AuthStateChangePasswordVisibilityCopyWith<$Res> {
  _$AuthStateChangePasswordVisibilityCopyWithImpl(this._self, this._then);

  final AuthStateChangePasswordVisibility _self;
  final $Res Function(AuthStateChangePasswordVisibility) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPasword = null,}) {
  return _then(AuthStateChangePasswordVisibility(
isPasword: null == isPasword ? _self.isPasword : isPasword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AuthStateShowSignUp implements AuthState {
  const AuthStateShowSignUp();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateShowSignUp);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.showSignUp()';
}


}




/// @nodoc


class AuthStateSignUpError implements AuthState {
  const AuthStateSignUpError(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateSignUpErrorCopyWith<AuthStateSignUpError> get copyWith => _$AuthStateSignUpErrorCopyWithImpl<AuthStateSignUpError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSignUpError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.signUpError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthStateSignUpErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSignUpErrorCopyWith(AuthStateSignUpError value, $Res Function(AuthStateSignUpError) _then) = _$AuthStateSignUpErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthStateSignUpErrorCopyWithImpl<$Res>
    implements $AuthStateSignUpErrorCopyWith<$Res> {
  _$AuthStateSignUpErrorCopyWithImpl(this._self, this._then);

  final AuthStateSignUpError _self;
  final $Res Function(AuthStateSignUpError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthStateSignUpError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
