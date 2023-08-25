import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/pages/register/bloc/register_bloc.dart';
import 'package:lash_app/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                        child: reusableText(
                            'Enter your details bellow & free sign up')),
                    Container(
                      margin: EdgeInsets.only(
                        top: 66.h,
                      ),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Username'),
                          buildTextField('Enter your username', 'name',
                              const Icon(Icons.person_2_rounded), (userName) {
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(userName));
                          }),
                          reusableText('Email'),
                          buildTextField('Enter your email address', 'email',
                              const Icon(Icons.email_rounded), (email) {
                            context.read<RegisterBloc>().add(EmailEvent(email));
                          }),
                          reusableText('Password'),
                          buildTextField('Enter your password', 'password',
                              const Icon(Icons.lock_outline_rounded),
                              (password) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(password));
                          }),
                          reusableText('Confirm password'),
                          buildTextField('Confirm your password', 'password',
                              const Icon(Icons.lock_outline_rounded),
                              (rePassword) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(rePassword));
                          }),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: reusableText(
                            'Be creating an account you have to agree with our them & conditions.')),
                    buildLogInAndRegisterButton('Sign Up', 'login', () {
                      // Navigator.of(context).pushNamed('register');
                      RegisterController(context: context)
                          .handleEmailRegister();
                    }),
                  ],
                ),
              ),
            )));
      },
    );
  }
}
