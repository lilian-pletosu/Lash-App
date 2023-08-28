import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/routes/routes.dart';
import 'package:lash_app/common/values/colors.dart';
import 'package:lash_app/pages/sign_in/widgets/sign_in_widget.dart';

import '../../common_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset('assets/icons/menu_icon.png'),
          ),
          Text(
            'Profile',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset('assets/icons/menu_dots_icon.png'),
          )
        ],
      ),
    ),
  );
}

// profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage('assets/images/avatar.png'))),
    child: Image(
      image: const AssetImage('assets/icons/edit_icon.png'),
      width: 20.w,
      height: 20.h,
      color: AppColors.primaryElement,
    ),
  );
}

Widget profileName(String username) {
  return reusableMainText(username, color: AppColors.primaryText, fontSize: 25);
}

var imagesInfo = <String, String>{
  'Settings': 'settings_icon.png',
  'Security': 'security_icon.png',
  'Services': 'services_icon.png',
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                    'assets/icons/${imagesInfo.values.elementAt(index)}',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
