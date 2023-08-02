import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //BlocProvuder.of<SignInBloc>(contet).state
        final state = context.read<SignInBloc>().state;

        String emailAddres = state.email;
        String password = state.password;

        if (emailAddres.isEmpty) {
          print('Email is empty');
        } else {
          print('email is ${state.email}');
        }

        if (password.isEmpty) {
          print('password empty');
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddres, password: password);

          if (credential.user == null) {
            print('user does not exist');
          }

          if (!credential.user!.emailVerified) {
            print('not varified');
          }

          var user = credential.user;

          if (user != null) {
            // we got verified user from firebase
            print('user exist');
          } else {
            // we have erro getting user from firebase
            print('no user');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            print('Email format is wrong.');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
