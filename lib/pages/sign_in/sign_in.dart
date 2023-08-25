import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/pages/sign_in/sign_in_controller.dart';
import 'package:lash_app/pages/sign_in/widgets/sign_in_widget.dart';

import 'bloc/sign_in_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusableText('Or use your email account login')),
                    Container(
                      margin: EdgeInsets.only(
                        top: 66.h,
                      ),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField('Enter your email address', 'email',
                              const Icon(Icons.person_2_rounded), (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField('Enter your password', 'password',
                              const Icon(Icons.lock_outline_rounded), (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLogInAndRegisterButton('Login', 'login', () {
                      SignInController(context: context).handleSignIn('email');
                    }),
                    buildLogInAndRegisterButton('Register', 'register', () {
                      Navigator.of(context).pushNamed('/register');
                    }),
                  ],
                ),
              ),
            )));
      },
    );
  }
}
