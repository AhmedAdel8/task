import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String message;
  final EmployeeModel employee;
  final String token;

  LoginResponseModel({
    required this.message,
    required this.employee,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class EmployeeModel {
  final int id;
  final String ?email;
  final String? name;
  final String? phone;
  final int code;
  final String ?image;
  
  @JsonKey(name: 'department_id')
  final int departmentId;
  
  final String status;
  
  @JsonKey(name: 'role_id')
  final int roleId;

  EmployeeModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.code,
    required this.image,
    required this.departmentId,
    required this.status,
    required this.roleId,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}