import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Available_doctor_page/view/AvailableDoctorWidgets/patient_doctor_block.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBodyList extends StatelessWidget {
  final bool isFullHeight;
  const PatientBodyList({super.key, required this.isFullHeight});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit()..getAppointmentstatus(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          if (state is PatientFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          double height = isFullHeight
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.height * 0.55;

          if (state is PatientLoading) {
            return SizedBox(
              height: height,
              width: MediaQuery.of(context).size.width,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is PatientDoctorStageSuccess) {
            final doctorModel = state.requestStatusModel;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              height: height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: doctorModel!.students!.length,
                itemBuilder: (context, index) {
                  return PatientDoctorBlock(student: doctorModel, index: index);
                },
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/no_doctor.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text(
                      context.watch<ThemeCubit>().isArabic
                          ? Lang.arabLang["message1"]!
                          : Lang.enLang["message1"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Styles.basicColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      context.watch<ThemeCubit>().isArabic
                          ? Lang.arabLang["message2"]!
                          : Lang.enLang["message2"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
