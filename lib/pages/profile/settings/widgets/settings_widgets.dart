import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: Text(
          'Settings',
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, Function() func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text('Confirm logout'),
              content: Text('Confirm logout'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel')),
                TextButton(onPressed: func, child: Text('Confirm'))
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
                style:
                    TextStyle(color: AppColors.primaryElement, fontSize: 21.sp),
              ),
            ],
          )),
    ),
  );
}
