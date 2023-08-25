import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/pages/register/bloc/register_bloc.dart';
import 'package:lash_app/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username can not be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                'An email has been sent to your register email. To activate it please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is to weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Your email in not valid');
      }
    }
  }
}
