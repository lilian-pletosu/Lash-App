import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.grey.withOpacity(0.8),
          height: 1.0,
        )),
    backgroundColor: Colors.white,
    centerTitle: true,
    bottomOpacity: 0.5,
    shadowColor: Colors.transparent,
    title: Text(
      'Log In',
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset('assets/icons/google.png'),
        )),
        GestureDetector(
            child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset('assets/icons/apple-logo.png'),
        )),
      ],
    ),
  );
}
