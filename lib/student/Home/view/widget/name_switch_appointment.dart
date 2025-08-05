import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/appointment_page_cubit.dart';
import 'package:dentech_smile/student/Home/model/add_appointment.dart';
import 'package:dentech_smile/student/Home/view/widget/delete_time_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameSwitchAppointment extends StatelessWidget {
  final AddAppointment item;
  const NameSwitchAppointment({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w500,
              fontSize: Static.getwieght(context, 22),
              color: Colors.black),
        ),
        Text(
          " [${item.date}]",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w400,
              fontSize: Static.getwieght(context, 17),
              color: Static.lightcolor2),
        ),
        const Spacer(),
        Text(
          "off",
          style: TextStyle(
              fontSize: Static.getwieght(context, 16),
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w500),
        ),
        BlocBuilder<AppointmentPageCubit, AppointmentPageState>(
          builder: (context, state) {
            final cubit = context.read<AppointmentPageCubit>();
            return Switch(
                value: item.active,
                onChanged: (nlan) async {
                  if (item.active) {
                    var result = await showDialog(
                        context: context,
                        builder: (context) => const DeleteTimeDialog());
                    if (result) {
                      cubit.toggleDayActive(item.id, item.date);
                    }
                  } else {
                    cubit.toggleDayActive(item.id, item.date);
                  }
                },
                activeTrackColor: Static.basiccolor,
                activeColor: const Color(0xff004F54),
                inactiveThumbColor: Colors.black,
                inactiveTrackColor: const Color(0xffD9D9D9));
          },
        ),
        Text(
          "on",
          style: TextStyle(
              fontSize: Static.getwieght(context, 16),
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
