import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _emailController = TextEditingController().obs;
  final _passwordController = TextEditingController().obs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController.value,
            decoration: const InputDecoration(hintText: 'email'),
          ),
          TextField(
            controller: _passwordController.value,
            obscureText: true,
            decoration: const InputDecoration(hintText: 'password'),
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  await GoogleSignIn().signIn();
                } catch (FirebaseAuthException) {}
              },
              child: const Text('Login with Google')),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.value.text,
                    password: _passwordController.value.text);
              },
              child: Text('Login with email password'))
        ],
      ),
    );
  }
}
