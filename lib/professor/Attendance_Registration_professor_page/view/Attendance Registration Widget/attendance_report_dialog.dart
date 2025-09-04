import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/controller/cubit/attendence_report_cubit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendenceReportDialog extends StatefulWidget {
  final String id;
  const AttendenceReportDialog({super.key, required this.id});

  @override
  State<AttendenceReportDialog> createState() => _AttendenceReportDialogState();
}

class _AttendenceReportDialogState extends State<AttendenceReportDialog> {
  String? date;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendenceReportCubit, AttendenceReportState>(
      listener: (context, state) {
        if(state is AttendenceReportSuccess){
          Navigator.of(context).pop();
        }else if(state is AttendenceReportFailure){
          Static.failure(context, state.errormessage);
           Navigator.of(context).pop();
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.23,
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
                      "Select the date you want",
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
                    Text(
                      date == null ? "   yyyy-mm-dd  " : "   $date  ",
                      style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        fontSize: Static.getwieght(context, 18),
                      ),
                    ),
                    InkWell(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        String twoDigits(int n) => n.toString().padLeft(2, '0');
                        if (picked != null) {
                          if (!context.mounted) return;
                          setState(() {
                            date =
                                "${picked.year.toString()}-${twoDigits(picked.month)}-${twoDigits(picked.day)}";
                          });
                        }
                      },
                      child: Text(
                        "Click here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: const Color(0xfff34966),
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
                        if (date == null) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(CustomSnackBar().customSnackBar(
                                'Oops',
                                "Date is required",
                                ContentType.failure));
                        } else {
                          BlocProvider.of<AttendenceReportCubit>(context)
                              .getAttendenceReport(
                                  id: widget.id, date: date.toString());
                        }
                      },
                      child: BlocBuilder<AttendenceReportCubit,
                          AttendenceReportState>(
                        builder: (context, state) {
                          if (state is AttendenceReportLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                          return Text(
                            "Search",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    (MediaQuery.of(context).size.width / 430) *
                                        17,
                                color: Colors.white),
                          );
                        },
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
