import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/appointment_of_day_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/select_day_widget.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 5),
        Container(
          alignment: Alignment.centerLeft,
          margin:
              EdgeInsets.symmetric(horizontal: Static.getwieght(context, 20)),
          child: Text(
            "Weekly schedule",
            style: TextStyle(
                fontFamily: Static.arialRoundedMTfont,
                fontSize: Static.getwieght(context, 22),
                color: Colors.black),
          ),
        ),
        const SelectDayWidget(),
        const AppointmentOfDayWidget()
      ],
    );
  }
}
