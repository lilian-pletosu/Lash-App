import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lash_app/common/values/colors.dart';
import 'package:lash_app/pages/calendar/widgets/calendar_widgets.dart';

import 'bloc/calendar_bloc.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay;
    DateTime _focusedDay;
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: BlocBuilder<CalendarBloc, CalendarState>(
            builder: (context, state) {
              return Container(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    children: [
                      CalendarTimeline(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 2),
                        lastDate: DateTime(DateTime.now().year + 2),
                        onDateSelected: (date) => print(date),
                        leftMargin: 20,
                        monthColor: Colors.blueGrey,
                        dayColor: Colors.teal[200],
                        activeDayColor: Colors.white,
                        activeBackgroundDayColor: Colors.redAccent[100],
                        dotsColor: Color(0xFF333A47),
                        selectableDayPredicate: (date) => date.day != 23,
                        locale: 'en_ISO',
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.primaryElement),
                        width: double.infinity.w,
                        height: 80.h,
                        child: Text('data'),
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}
