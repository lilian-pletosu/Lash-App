import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/pages/application/bloc/app_bloc.dart';
import 'package:lash_app/common/values/colors.dart';
import 'package:lash_app/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: BottomNavigationBar(
                    elevation: 0,
                    unselectedItemColor: Colors.grey,
                    selectedIconTheme: const IconThemeData(color: Colors.grey),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: Colors.blue,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: state.index,
                    onTap: (value) =>
                        context.read<AppBloc>().add(TriggerAppEvent(value)),
                    items: bottomTabs),
              ),
            ),
          ),
        );
      },
    );
  }
}
