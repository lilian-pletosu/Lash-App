import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/util/colors.dart';

import 'bloc/welcome_bloc.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          'Next',
                          'Welcome',
                          'Adipisicing officia deserunt magna aliquip et.',
                          'assets/images/sogo.png'),
                      _page(
                          2,
                          context,
                          'Next',
                          'Second page',
                          'Adipisicing officia deserunt magna aliquip et.',
                          'assets/images/sogo.png'),
                      _page(
                          3,
                          context,
                          'Start',
                          'Third page',
                          'Adipisicing officia deserunt magna aliquip et.',
                          'assets/images/sogo.png'),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page.toInt(),
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThirdElementText,
                            activeColor: AppColors.primaryElement,
                            size: const Size.square(8.0),
                            activeSize: const Size(18.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.linear);
            } else {
              // jump to a new page
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.5,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            )),
          ),
        )
      ],
    );
  }
}
