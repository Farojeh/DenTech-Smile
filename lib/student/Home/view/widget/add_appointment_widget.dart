import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/add_appointment_cubit.dart';
import 'package:dentech_smile/student/Home/model/time.dart';
import 'package:dentech_smile/student/Home/view/widget/appointment_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointmentWidget extends StatefulWidget {
  const AddAppointmentWidget({super.key});

  @override
  State<AddAppointmentWidget> createState() => _AddAppointmentWidgetState();
}

class _AddAppointmentWidgetState extends State<AddAppointmentWidget> {
  List<TimeApp> times = [
    TimeApp(date: "5/5/2025", time: "11 AM", future: true),
    TimeApp(date: "5/5/2025", time: "11 AM", future: false),
    TimeApp(date: "5/5/2025", time: "11 AM", future: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         CustomTitle(
          image: "assets/images/appointment_state.png",
          title: "Appointments",
          more: "add Appointments",
          ismore: true,
          onTapfun: () {
             showDialog(
                context: context,
                builder: (context) => BlocProvider<AddAppointmentCubit>(
                      create: (context) => AddAppointmentCubit(),
                      child: const AppointmentDialog()
                    ));
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Static.getwieght(context, 40),
              vertical: Static.gethieght(context, 25)),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 15,
            childAspectRatio: 163 / 31,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(times.length, (index) {
              return Container(
                height: Static.gethieght(context, 31),
                width: Static.getwieght(context, 163),
                decoration: BoxDecoration(
                    color: times[index].future
                        ? Static.basiccolor.withOpacity(0.46)
                        : const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text(
                  "${times[index].date}  ${times[index].time}",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: Static.getwieght(context, 16)),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
