import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        )),
    backgroundColor: Colors.white,
    centerTitle: true,
    bottomOpacity: 0.5,
    shadowColor: Colors.transparent,
    title: Text(
      type,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_reusableIcons('google'), _reusableIcons('apple')],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
      child: SizedBox(
    width: 30.w,
    height: 30.w,
    child: Image.asset('assets/icons/$iconName.png'),
  ));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, Icon icon,
    void Function(String value) func) {
  return Container(
    width: double.infinity,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryFourthElementText),
        borderRadius: BorderRadius.all(Radius.circular(15.w))),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          child: icon,
        ),
        SizedBox(
          width: 250.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintStyle:
                  const TextStyle(color: AppColors.primarySecondaryElementText),
            ),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
      margin: EdgeInsets.only(left: 25.w),
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password',
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 12.sp),
        ),
      ));
}

Widget buildLogInAndRegisterButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == 'login' ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: buttonType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              // check for registration button border color
              color: buttonType == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourthElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText),
      )),
    ),
  );
}

Widget reusableMainText(String menuText,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      menuText,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
    ),
  );
}
