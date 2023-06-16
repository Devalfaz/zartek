import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zartek/repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              context.read<AuthRepository>().loginWithGoogle();
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
