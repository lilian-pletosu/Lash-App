import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:lash_app/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepositoty(),
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: MaterialApp(
            title: 'Lash app ',
          ),
        ));
  }
}
