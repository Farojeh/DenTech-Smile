import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/appointment_of_day_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/select_day_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayWidget extends StatelessWidget {
  const DayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 2),
        Container(
          alignment: Alignment.centerLeft,
          margin:
              EdgeInsets.symmetric(horizontal: Static.getwieght(context, 20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.type == 0) {
                    return Text(
                      "Weekly schedule",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          fontSize: Static.getwieght(context, 22),
                          color: Colors.black),
                    );
                  }
                  return Text(
                    "Practical Schedule",
                    style: TextStyle(
                        fontFamily: Static.arialRoundedMTfont,
                        fontSize: Static.getwieght(context, 22),
                        color: Colors.black),
                  );
                },
              ),
              const Spacer(),
              InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).changetype();
                },
                child: Container(
                  height: Static.gethieght(context, 31),
                  width: Static.getwieght(context, 50),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Static.lightcolor2),
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    "assets/images/swap.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SelectDayWidget(),
        const AppointmentOfDayWidget()
      ],
    );
  }
}
