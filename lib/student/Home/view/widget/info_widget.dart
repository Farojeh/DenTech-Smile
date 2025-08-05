import 'package:dentech_smile/student/Home/controller/cubit/patient_info_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:dentech_smile/student/Home/view/widget/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoWidget extends StatelessWidget {
  final String patient ;
  final int patientid;
  const InfoWidget({super.key, required this.patient, required this.patientid});

  @override
  Widget build(BuildContext context) {
    return  CustomTitle(
      image: "assets/images/info.png",
      title: patient,
      more: "Show Info",
      ismore: true,
      onTapfun: () {
        showDialog(
        context: context,
        builder: (context) => BlocProvider<PatientInfoCubit>(
          create: (context) => PatientInfoCubit(patientid),
          child: const InfoDialog(),
        ),
      );
      },
    );
  }
}
