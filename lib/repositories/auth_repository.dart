import 'package:beegains/models/response_model.dart';
import 'package:beegains/models/user_model.dart';
import 'package:beegains/repositories/api.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  User currentUser = User.empty;
  Stream<User> get user => Stream.value(currentUser);
  API api = API();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.sendRequest.post<ResponseModel<User>>(
        '/login',
        data: {
          'username': email,
          'password': password,
        },
      );
      currentUser =
          ResponseModel<User>.fromJson(response.data! as Map<String, dynamic>)
              .data;
    } on DioException catch (e) {
      final error = ResponseModel<dynamic>.fromJson(
        e.response?.data as Map<String, dynamic>,
      );
      throw LogInWithEmailAndPasswordFailure.fromCode(
        error.message,
      );
    }

    return;
  }

  Future<void> logout() async {
    currentUser = User.empty;
    return;
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'Invalid Credentials':
        return const LogInWithEmailAndPasswordFailure(
          'Invalid Credentials. Please try again.',
        );
      case 'User Disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}
