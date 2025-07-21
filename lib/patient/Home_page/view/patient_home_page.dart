import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_app_bar_image.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_app_bar_show_menu.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_app_bar_title.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_body_oral_list.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_body_title.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_eleveted_button.dart';
import 'package:dentech_smile/patient/Home_page/view/PatientHomeWidgets/patient_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => PatientCubit()
        ..getAppointmentstatus()
        ..getOralDoctor(),
      child: Directionality(
        textDirection: context.watch<ThemeCubit>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            leading: const PatientAppBarShowMenu(),
            title: const PatientAppBarTitle(),
            actions: const [PatientAppBarImage()],
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02,
                ),
                child: Column(
                  children: [
                    const PatientHomeContainer(),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.04),
                      child: const Column(
                        children: [
                          PatientBodyTitle(),
                          PatientBodyOralList(isFullHeight: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: size.height * 0.03,
                left: size.width * 0.05,
                child: const PatientElevetedButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
