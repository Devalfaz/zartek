import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // This is the generated file

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.employeeId,
    required this.userTypeId,
    required this.employee,
    required this.userType,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final int id;
  final String username;
  final int employeeId;
  final String userTypeId;
  final Employee employee;
  final UserType userType;
  final String token;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const User empty = User(
    id: 0,
    username: '',
    employeeId: 0,
    userTypeId: '',
    employee: Employee.empty,
    userType: UserType.empty,
    token: '',
  );
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [
        id,
        username,
        employeeId,
        userTypeId,
        employee,
        userType,
        token,
      ];
}

@JsonSerializable()
class Employee {
  const Employee({
    required this.id,
    required this.employeeName,
    required this.employeeCode,
    required this.franchiseId,
    required this.franchise,
  });
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  static const empty = Employee(
    id: 0,
    employeeName: '',
    employeeCode: '',
    franchiseId: 0,
    franchise: Franchise.empty,
  );
  final int id;
  final String employeeName;
  final String employeeCode;
  final int franchiseId;
  final Franchise franchise;
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

@JsonSerializable()
class Franchise {
  const Franchise({
    required this.id,
    required this.franchiseeCode,
  });
  factory Franchise.fromJson(Map<String, dynamic> json) =>
      _$FranchiseFromJson(json);

  static const empty = Franchise(
    id: 0,
    franchiseeCode: '',
  );
  final int id;
  final String franchiseeCode;
  Map<String, dynamic> toJson() => _$FranchiseToJson(this);
}

@JsonSerializable()
class UserType {
  const UserType({
    required this.id,
    required this.name,
  });
  factory UserType.fromJson(Map<String, dynamic> json) =>
      _$UserTypeFromJson(json);

  static const empty = UserType(
    id: 0,
    name: '',
  );
  final int id;
  final String name;
  Map<String, dynamic> toJson() => _$UserTypeToJson(this);
}
