import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_config_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_body.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/data_patient_button.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/translate_widget.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DatePatient extends StatelessWidget {
  const DatePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocListener<DataPatientConfigCubit, DataPatientConfigState>(
        listener: (context, state) {
          if (state is DataPatientConfigFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(CustomSnackBar().customSnackBar(
                  'Oops', state.errorMessage, ContentType.failure));
          } else if (state is DataPatientSuccess) {
            userInfo!.setBool(Static.patientdata, true);
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          }
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              const DataPatientBody(),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.89,
                  child: const DataPatientButton()),
              const Positioned(top: 30, right: 10, child: TranslateWidget())
            ],
          ),
        ),
      ),
    ));
  }
}
