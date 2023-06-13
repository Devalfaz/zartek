import 'package:beegains/bootstrap.dart';
import 'package:beegains/repositories/auth_repository.dart';
import 'package:beegains/screens/app.dart';

void main() {
  final authRepository = AuthRepository();

  bootstrap(() => App(authRepository: authRepository));
}
