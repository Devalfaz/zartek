import 'package:beegains/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print(context.read<AuthRepository>().api.dio.options.baseUrl);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        // child: BlocProvider(
        //   create: (_) => LoginCubit(context.read<AuthRepository>()),
        //   child: const LoginForm(),
        // ),
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
