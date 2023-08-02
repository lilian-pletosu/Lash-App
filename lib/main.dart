import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:lash_app/pages/sign_in/sign_in.dart';
import 'package:lash_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:lash_app/pages/welcome/welcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (context) => SignInBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Welcome(),
          routes: {'signIn': (context) => const SignIn()},
        ),
      ),
    );
  }
}
