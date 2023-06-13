// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      username: json['username'] as String,
      employeeId: json['employeeId'] as int,
      userTypeId: json['userTypeId'] as String,
      employee: Employee.fromJson(json['employee'] as Map<String, dynamic>),
      userType: UserType.fromJson(json['userType'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'employeeId': instance.employeeId,
      'userTypeId': instance.userTypeId,
      'employee': instance.employee,
      'userType': instance.userType,
      'token': instance.token,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int,
      employeeName: json['employeeName'] as String,
      employeeCode: json['employeeCode'] as String,
      franchiseId: json['franchiseId'] as int,
      franchise: Franchise.fromJson(json['franchise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'employeeCode': instance.employeeCode,
      'franchiseId': instance.franchiseId,
      'franchise': instance.franchise,
    };

Franchise _$FranchiseFromJson(Map<String, dynamic> json) => Franchise(
      id: json['id'] as int,
      franchiseeCode: json['franchiseeCode'] as String,
    );

Map<String, dynamic> _$FranchiseToJson(Franchise instance) => <String, dynamic>{
      'id': instance.id,
      'franchiseeCode': instance.franchiseeCode,
    };

UserType _$UserTypeFromJson(Map<String, dynamic> json) => UserType(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserTypeToJson(UserType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
