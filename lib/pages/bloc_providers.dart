import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/pages/register/bloc/register_bloc.dart';
import 'package:lash_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:lash_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
