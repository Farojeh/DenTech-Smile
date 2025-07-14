import 'package:dentech_smile/patient/Available_doctor_page/view/AvailableDoctorWidgets/patient_availabe_app_bar_title.dart';
import 'package:dentech_smile/patient/Available_doctor_page/view/AvailableDoctorWidgets/patient_available_app_bar_action.dart';
import 'package:dentech_smile/patient/Available_doctor_page/view/AvailableDoctorWidgets/patient_available_app_bar_arrow.dart';
import 'package:dentech_smile/patient/Available_doctor_page/view/AvailableDoctorWidgets/patient_body_list.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AvailableDoctorPage extends StatelessWidget {

  const AvailableDoctorPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
          PatientCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: PatientAvailableAppBarArrow(),
            title: PatientAvailabeAppBarTitle(),
            actions: [PatientAvailableAppBarAction()],
          ),
          body: SingleChildScrollView(child: PatientBodyList(isFullHeight: true,)),
        ),
      ),
    );
  }
}
