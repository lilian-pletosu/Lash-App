// Unify blocProvider and routes and pages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/common/routes/names.dart';
import 'package:lash_app/global.dart';
import 'package:lash_app/pages/application/application_page.dart';
import 'package:lash_app/pages/application/bloc/app_bloc.dart';
import 'package:lash_app/pages/home/bloc/home_page_bloc.dart';
import 'package:lash_app/pages/home/home_page.dart';
import 'package:lash_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:lash_app/pages/profile/settings/settings_page.dart';
import 'package:lash_app/pages/register/bloc/register_bloc.dart';
import 'package:lash_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:lash_app/pages/sign_in/sign_in.dart';
import 'package:lash_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:lash_app/pages/welcome/welcome.dart';

import '../../pages/register/register.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBloc(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          )),
    ];
  }

// return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

// a modal that covers entire screen as we click navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    // check for route name matching when navigator gets triggered
    if (settings.name != null) {
      print("valid route ${settings.name}");
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.SIGN_IN && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
