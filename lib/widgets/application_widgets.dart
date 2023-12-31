import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lash_app/pages/calendar/calendar_page.dart';
import 'package:lash_app/pages/home/home_page.dart';
import 'package:lash_app/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const CalendarPage(),
    Center(
      child: Text('Add'),
    ),
    Center(
      child: Text('Service'),
    ),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.home_rounded),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.home_rounded,
          color: Colors.blue,
        ),
      ),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.calendar_month_rounded),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.calendar_month_rounded,
          color: Colors.blue,
        ),
      ),
      label: 'Calendar'),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.add_rounded),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.blue,
        ),
      ),
      label: 'Add'),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.design_services_rounded),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.design_services_rounded,
          color: Colors.blue,
        ),
      ),
      label: 'Services'),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: const Icon(Icons.person_2_rounded),
      ),
      activeIcon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: const Icon(
          Icons.person_2_rounded,
          color: Colors.blue,
        ),
      ),
      label: 'Profile'),
];
