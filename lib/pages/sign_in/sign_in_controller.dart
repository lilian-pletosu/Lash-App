import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/common/values/constants.dart';
import 'package:lash_app/global.dart';
import 'package:lash_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:lash_app/widgets/flutter_toast.dart';

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
          toastInfo(msg: 'You need to fill email address');
        }

        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill password');
          return;
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddres, password: password);

          if (credential.user == null) {
            toastInfo(msg: 'User does not exist');
            return;
          }

          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your email address');
            return;
          }

          var user = credential.user;

          if (user != null) {
            // we got verified user from firebase
            print('user exist');

            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;

            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, id);

            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            // we have erro getting user from firebase
            toastInfo(msg: 'Currently you are not a user of this app.');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Email format is wrong.');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
