import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/add_appointment_cubit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDialog extends StatelessWidget {
  const AppointmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocListener<AddAppointmentCubit, AddAppointmentState>(
        listener: (context, state) {
          if (state is AddAppointmentfailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(CustomSnackBar().customSnackBar(
                  'Oops', state.errormessage, ContentType.failure));
          } else if (state is AddAppointmentSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/add-event 1.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add a new appointment",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          fontSize: Static.getwieght(context, 18),
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          fontSize: Static.getwieght(context, 20),
                          color: Colors.black),
                    ),
                    BlocBuilder<AddAppointmentCubit, AddAppointmentState>(
                      builder: (context, state) {
                        return Text(
                          state.date,
                          style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w400,
                            fontSize: Static.getwieght(context, 18),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      onTap: () async {
                        final DateTime now = DateTime.now();
                        final DateTime lastDate =
                            DateTime(now.year + 1, now.month, now.day);
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: lastDate,
                        );
                        String twoDigits(int n) => n.toString().padLeft(2, '0');
                        if (picked != null) {
                          if (!context.mounted) return;
                          BlocProvider.of<AddAppointmentCubit>(context).setdate(
                              d: twoDigits(picked.day),
                              m: twoDigits(picked.month),
                              y: picked.year.toString());
                        }
                      },
                      child: Text(
                        "Click here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xfffF34966),
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          fontSize: Static.getwieght(context, 16),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          fontSize: Static.getwieght(context, 20),
                          color: Colors.black),
                    ),
                    BlocBuilder<AddAppointmentCubit, AddAppointmentState>(
                      builder: (context, state) {
                        return Text(
                          "   ${state.time} ${state.am}  ",
                          style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w400,
                            fontSize: Static.getwieght(context, 18),
                          ),
                        );
                      },
                    ),
                    InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        String twoDigits(int n) => n.toString().padLeft(2, '0');

                        if (picked != null) {
                          if (!context.mounted) return;

                          final String hour =
                              twoDigits(picked.hourOfPeriod); // 01 to 12
                          final String minute = twoDigits(picked.minute);
                          final String am =
                              picked.period == DayPeriod.am ? "AM" : "PM";

                          BlocProvider.of<AddAppointmentCubit>(context)
                              .settime(h: hour, m: minute, am: am);
                        }
                      },
                      child: Text(
                        "Click here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xfffF34966),
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w400,
                          fontSize: Static.getwieght(context, 16),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CustomButton(
                      color: const Color(0xff46A1A7),
                      colorside: const Color(0xff46A1A7),
                      redbl: 15,
                      redbr: 15,
                      redtl: 15,
                      redtr: 15,
                      height: (MediaQuery.of(context).size.height / 932) * 48,
                      width: MediaQuery.of(context).size.width * 0.3,
                      onPressed: () async {
                        var cubit =
                            BlocProvider.of<AddAppointmentCubit>(context);
                        cubit.save();
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                (MediaQuery.of(context).size.width / 430) * 17,
                            color: Colors.white),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
