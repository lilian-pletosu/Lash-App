import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/routes/routes.dart';
import 'package:lash_app/global.dart';
import 'package:lash_app/pages/welcome/welcome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lash_app/common/values/colors.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: AppColors.primaryText))),
          debugShowCheckedModeBanner: false,
          home: const Welcome(),
          onGenerateRoute: AppPages.generateRouteSettings,
        ),
      ),
    );
  }
}
