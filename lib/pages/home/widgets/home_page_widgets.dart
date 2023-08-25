import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/common/values/colors.dart';
import 'package:lash_app/pages/home/bloc/home_page_bloc.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 30.w,
              height: 20.h,
              child: Image.asset('assets/icons/menu_icon.png')),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/avatar.png'))),
            ),
          )
        ],
      ),
    ),
  );
}

// reusable big text widget
Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

// search input
Widget searchView() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'search...',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          // margin: EdgeInsets.only(left: 10.w),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset(
            'assets/icons/options.png',
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}

// for sliders view
Widget slidersView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) =>
              context.read<HomePageBloc>().add(HomePageDots(value)),
          children: [
            slidersContainer(imagePath: 'assets/images/slide1.jpg'),
            slidersContainer(imagePath: 'assets/images/slide2.png'),
            slidersContainer(imagePath: 'assets/images/slide3.png'),
          ],
        ),
      ),
      // dots indicator
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: Size.square(5.0),
              activeSize: Size(15.5, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

Widget slidersContainer({String imagePath = 'assets/images/slide2.png'}) {
  return Container(
    margin: EdgeInsets.only(right: 8.0.w),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image:
            DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
  );
}

// menu view for show all appointments
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _reusableText('Appointments', fontSize: 15),
            GestureDetector(
              child: _reusableText('See all',
                  color: AppColors.primaryThirdElementText,
                  fontSize: 11,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reusableMenuText("Today"),
            _reusableMenuText("Tommorow",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
            _reusableMenuText("After tommorow",
                textColor: AppColors.primaryThirdElementText,
                backgroundColor: Colors.white),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableText(String menuText,
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

Widget _reusableMenuText(String text,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    // margin: EdgeInsets.only(right: 1.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: _reusableText(text,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 12),
  );
}
