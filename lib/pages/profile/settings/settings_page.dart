import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/routes/routes.dart';
import 'package:lash_app/common/service/storage_service.dart';
import 'package:lash_app/common/values/colors.dart';
import 'package:lash_app/common/values/constants.dart';
import 'package:lash_app/global.dart';
import 'package:lash_app/pages/profile/settings/widgets/settings_widgets.dart';

import 'bloc/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: Text('Confirm logout'),
                              content: Text('Confirm logout'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () => removeUserData(),
                                    child: Text('Confirm'))
                              ],
                            );
                          });
                    },
                    child: Center(
                      child: Container(
                          height: 50.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1)),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/logout_icon.png',
                                color: AppColors.primaryElement,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                'Log Out',
                                style: TextStyle(
                                    color: AppColors.primaryElement,
                                    fontSize: 21.sp),
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
