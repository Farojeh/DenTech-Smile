import 'package:dentech_smile/patient/Archive_page/view/PatientArchiveWidgets/patient_archive_app_bar_arrow.dart';
import 'package:dentech_smile/patient/Archive_page/view/PatientArchiveWidgets/patient_archive_app_bar_title.dart';
import 'package:dentech_smile/patient/Archive_page/view/PatientArchiveWidgets/patient_archive_list.dart';
import 'package:dentech_smile/patient/Case_page/controller/patient_case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCaseCubit()..getCases(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: PatientArchiveAppBarArrow(),
            title: PatientArchiveAppBarTitle(),
          ),
          body: SingleChildScrollView(child: PatientArchiveList()),
        ),
      ),
    );
  }
}
