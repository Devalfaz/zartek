import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocListener<LoginCubit, LoginState>(
    //   listener: (context, state) {
    //     if (state.status.isFailure) {
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(
    //           SnackBar(
    //             content: Text(state.errorMessage ?? 'Authentication Failure'),
    //           ),
    //         );
    //     }
    //   },
    //   child:
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(),
            const SizedBox(height: 16),
            // _EmailInput(),
            const SizedBox(height: 8),
            // _PasswordInput(),
            const SizedBox(height: 8),
            _LoginButton(),
            const SizedBox(height: 8),
          ],
        ),
      ),
      // ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //  BlocBuilder<LoginCubit, LoginState>(
        //   builder: (context, state) {
        //     return state.status.isInProgress
        //         ? const CircularProgressIndicator()
        //         :
        ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed:
          //  state.isValid
          //     ? () => context.read<LoginCubit>().logInWithCredentials()
          //     :
          null,
      child: const Text('LOGIN'),
    );
    // },
    // );
  }
}
