import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/appointment_page_cubit.dart';
import 'package:dentech_smile/student/Home/model/add_appointment.dart';
import 'package:dentech_smile/student/Home/view/widget/add_time_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/delete_time_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/name_switch_appointment.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppointmentPage extends StatelessWidget {
  final AddAppointment item;
  const CustomAppointmentPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 5),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NameSwitchAppointment(
            item: item,
          ),
          const SizedBox(
            height: 10,
          ),
          item.active
              ? SizedBox(
                  height: Static.gethieght(context, 145),
                  width: Static.getwieght(context, 330),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 5),
                        padding: EdgeInsets.symmetric(
                            vertical: Static.gethieght(context, 32),
                            horizontal: Static.getwieght(context, 25)),
                        height: Static.gethieght(context, 110),
                        width: Static.getwieght(context, 330),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: item.schedule.length,
                            itemBuilder: (context, index) => InkWell(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.white.withOpacity(0)),
                                  onTap: () async {
                                    var result = await showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const DeleteTimeDialog());
                                    if (result) {
                                     // ignore: use_build_context_synchronously
                                     await BlocProvider.of<AppointmentPageCubit>(
                                      context)
                                  .deleteappointment(item.id ,item.schedule[index].id);
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: Static.gethieght(context, 36),
                                    width: Static.getwieght(context, 85),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.black45),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      item.schedule[index].time,
                                      style: TextStyle(
                                          fontFamily: Static.afacadfont,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize:
                                              Static.getwieght(context, 15)),
                                    ),
                                  ),
                                )),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 0,
                        child: CustomButton(
                            onPressed: () async {
                              final result = await showDialog(
                                  context: context,
                                  builder: (context) => const AddTimeDialog());
                              // ignore: use_build_context_synchronously
                              await BlocProvider.of<AppointmentPageCubit>(
                                      context)
                                  .addTimeToDay(item.id, result, item.date);
                            },
                            color: const Color(0xff328F96),
                            redbl: 10,
                            redbr: 10,
                            redtl: 10,
                            redtr: 10,
                            height: Static.gethieght(context, 25),
                            width: Static.getwieght(context, 60),
                            child: BlocBuilder<AppointmentPageCubit,
                                AppointmentPageState>(
                              builder: (context, state) {
                                if (state is Appointmentsubloading) {
                                  return const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(
                                    "Add Time",
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize:
                                            Static.getwieght(context, 13)),
                                  );
                                }
                              },
                            )),
                      ),
                    ],
                  ),
                )
              : Image.asset(
                  "assets/images/no appointment.png",
                  height: 135,
                  width: 135,
                  fit: BoxFit.contain,
                ),
        ],
      ),
    );
  }
}
