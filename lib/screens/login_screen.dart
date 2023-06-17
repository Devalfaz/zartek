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
        child: Column(
          children: [
            const Expanded(child: FlutterLogo(size: 200)),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                onPressed: () {
                  context.read<AuthRepository>().loginWithGoogle();
                },
                child: const Text(
                  'Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              //Gradient from light green to dark green
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightGreen,
                    Colors.green,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),

              child: MaterialButton(
                onPressed: () {
                  //Show a dialog to the user to enter the phone number
                  //Create a manual controller to get the phone number from the user
                  final phoneController = TextEditingController();
                  //Show the dialog to the user
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      title: const Text('Enter Phone Number'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            //Login with mobile
                            context.read<AuthRepository>().loginWithMobile(
                                  phoneController.text,
                                  context,
                                );
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Phone',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
