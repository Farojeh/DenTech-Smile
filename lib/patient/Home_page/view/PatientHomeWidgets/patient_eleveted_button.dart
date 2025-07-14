import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientElevetedButton extends StatelessWidget {
  const PatientElevetedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final cubit = context.watch<PatientCubit>();
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Styles.basicColor,
            fixedSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            if (cubit.appointmentStateNumb == 1) {
              Static.showMyDialog(context, cubit.statusMessage);
            }
            if (cubit.appointmentStateNumb == 2) {
              Static.showMyDialog(context, cubit.statusMessage);
            }
            if (cubit.appointmentStateNumb == 3) {
              GoRouter.of(context).push(AppRouter.available);
            }
          },
          child: const Text(
            'احجز موعدك',
            style: TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
