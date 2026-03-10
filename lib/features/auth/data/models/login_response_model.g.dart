// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String,
      employee: EmployeeModel.fromJson(
        json['employee'] as Map<String, dynamic>,
      ),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'employee': instance.employee,
      'token': instance.token,
    };

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      code: (json['code'] as num).toInt(),
      image: json['image'] as String?,
      departmentId: (json['department_id'] as num).toInt(),
      status: json['status'] as String,
      roleId: (json['role_id'] as num).toInt(),
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'code': instance.code,
      'image': instance.image,
      'department_id': instance.departmentId,
      'status': instance.status,
      'role_id': instance.roleId,
    };
