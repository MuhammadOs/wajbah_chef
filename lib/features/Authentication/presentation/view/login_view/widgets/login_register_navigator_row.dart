import 'package:flutter/material.dart';

class LoginRegisterNavigatorRow extends StatelessWidget {
  const LoginRegisterNavigatorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account? ',
            style: TextStyle(color: Colors.grey, fontSize: 14)),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'register');
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          child: const Text('Register',
              style: TextStyle(color: Colors.blue, fontSize: 14)),
        ),
      ],
    );
  }
}