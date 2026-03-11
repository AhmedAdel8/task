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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AuthStateChangePasswordVisibility value)?  authStateChangePasswordVisibility,TResult Function( AuthStateChangeRePasswordVisibility value)?  authStateChangeRePasswordVisibility,TResult Function( AuthStateShowSignUp value)?  showSignUp,TResult Function( AuthStateSignUpError value)?  signUpError,TResult Function( AuthStateSignUpSuccess value)?  signUpSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that);case AuthStateChangeRePasswordVisibility() when authStateChangeRePasswordVisibility != null:
return authStateChangeRePasswordVisibility(_that);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp(_that);case AuthStateSignUpError() when signUpError != null:
return signUpError(_that);case AuthStateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AuthStateChangePasswordVisibility value)  authStateChangePasswordVisibility,required TResult Function( AuthStateChangeRePasswordVisibility value)  authStateChangeRePasswordVisibility,required TResult Function( AuthStateShowSignUp value)  showSignUp,required TResult Function( AuthStateSignUpError value)  signUpError,required TResult Function( AuthStateSignUpSuccess value)  signUpSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AuthStateChangePasswordVisibility():
return authStateChangePasswordVisibility(_that);case AuthStateChangeRePasswordVisibility():
return authStateChangeRePasswordVisibility(_that);case AuthStateShowSignUp():
return showSignUp(_that);case AuthStateSignUpError():
return signUpError(_that);case AuthStateSignUpSuccess():
return signUpSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AuthStateChangePasswordVisibility value)?  authStateChangePasswordVisibility,TResult? Function( AuthStateChangeRePasswordVisibility value)?  authStateChangeRePasswordVisibility,TResult? Function( AuthStateShowSignUp value)?  showSignUp,TResult? Function( AuthStateSignUpError value)?  signUpError,TResult? Function( AuthStateSignUpSuccess value)?  signUpSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that);case AuthStateChangeRePasswordVisibility() when authStateChangeRePasswordVisibility != null:
return authStateChangeRePasswordVisibility(_that);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp(_that);case AuthStateSignUpError() when signUpError != null:
return signUpError(_that);case AuthStateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( bool isPasword)?  authStateChangePasswordVisibility,TResult Function( bool isPasword)?  authStateChangeRePasswordVisibility,TResult Function()?  showSignUp,TResult Function( String message)?  signUpError,TResult Function( String message)?  signUpSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateChangeRePasswordVisibility() when authStateChangeRePasswordVisibility != null:
return authStateChangeRePasswordVisibility(_that.isPasword);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp();case AuthStateSignUpError() when signUpError != null:
return signUpError(_that.message);case AuthStateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( bool isPasword)  authStateChangePasswordVisibility,required TResult Function( bool isPasword)  authStateChangeRePasswordVisibility,required TResult Function()  showSignUp,required TResult Function( String message)  signUpError,required TResult Function( String message)  signUpSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AuthStateChangePasswordVisibility():
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateChangeRePasswordVisibility():
return authStateChangeRePasswordVisibility(_that.isPasword);case AuthStateShowSignUp():
return showSignUp();case AuthStateSignUpError():
return signUpError(_that.message);case AuthStateSignUpSuccess():
return signUpSuccess(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( bool isPasword)?  authStateChangePasswordVisibility,TResult? Function( bool isPasword)?  authStateChangeRePasswordVisibility,TResult? Function()?  showSignUp,TResult? Function( String message)?  signUpError,TResult? Function( String message)?  signUpSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthStateChangePasswordVisibility() when authStateChangePasswordVisibility != null:
return authStateChangePasswordVisibility(_that.isPasword);case AuthStateChangeRePasswordVisibility() when authStateChangeRePasswordVisibility != null:
return authStateChangeRePasswordVisibility(_that.isPasword);case AuthStateShowSignUp() when showSignUp != null:
return showSignUp();case AuthStateSignUpError() when signUpError != null:
return signUpError(_that.message);case AuthStateSignUpSuccess() when signUpSuccess != null:
return signUpSuccess(_that.message);case _:
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


class AuthStateChangeRePasswordVisibility implements AuthState {
  const AuthStateChangeRePasswordVisibility({required this.isPasword});
  

 final  bool isPasword;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateChangeRePasswordVisibilityCopyWith<AuthStateChangeRePasswordVisibility> get copyWith => _$AuthStateChangeRePasswordVisibilityCopyWithImpl<AuthStateChangeRePasswordVisibility>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateChangeRePasswordVisibility&&(identical(other.isPasword, isPasword) || other.isPasword == isPasword));
}


@override
int get hashCode => Object.hash(runtimeType,isPasword);

@override
String toString() {
  return 'AuthState.authStateChangeRePasswordVisibility(isPasword: $isPasword)';
}


}

/// @nodoc
abstract mixin class $AuthStateChangeRePasswordVisibilityCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateChangeRePasswordVisibilityCopyWith(AuthStateChangeRePasswordVisibility value, $Res Function(AuthStateChangeRePasswordVisibility) _then) = _$AuthStateChangeRePasswordVisibilityCopyWithImpl;
@useResult
$Res call({
 bool isPasword
});




}
/// @nodoc
class _$AuthStateChangeRePasswordVisibilityCopyWithImpl<$Res>
    implements $AuthStateChangeRePasswordVisibilityCopyWith<$Res> {
  _$AuthStateChangeRePasswordVisibilityCopyWithImpl(this._self, this._then);

  final AuthStateChangeRePasswordVisibility _self;
  final $Res Function(AuthStateChangeRePasswordVisibility) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPasword = null,}) {
  return _then(AuthStateChangeRePasswordVisibility(
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

/// @nodoc


class AuthStateSignUpSuccess implements AuthState {
  const AuthStateSignUpSuccess(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateSignUpSuccessCopyWith<AuthStateSignUpSuccess> get copyWith => _$AuthStateSignUpSuccessCopyWithImpl<AuthStateSignUpSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateSignUpSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.signUpSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthStateSignUpSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthStateSignUpSuccessCopyWith(AuthStateSignUpSuccess value, $Res Function(AuthStateSignUpSuccess) _then) = _$AuthStateSignUpSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthStateSignUpSuccessCopyWithImpl<$Res>
    implements $AuthStateSignUpSuccessCopyWith<$Res> {
  _$AuthStateSignUpSuccessCopyWithImpl(this._self, this._then);

  final AuthStateSignUpSuccess _self;
  final $Res Function(AuthStateSignUpSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthStateSignUpSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
