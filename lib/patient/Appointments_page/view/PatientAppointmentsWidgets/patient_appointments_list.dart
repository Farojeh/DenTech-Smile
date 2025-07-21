import 'package:dentech_smile/patient/Appointments_page/view/PatientAppointmentsWidgets/patient_appointments_block.dart';
import 'package:dentech_smile/patient/Home_page/controller/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppointmentsList extends StatelessWidget {
  const PatientAppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is PatientLoading) {
          return SizedBox(
            height: screenHeight,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is PatientAppointmentSuccess) {
          final appointmentModel = state.appointmentModel;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => PatientAppointmentsBlock(
                appointments: appointmentModel.availableAppointments![index]),
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: const Color.fromRGBO(105, 105, 105, 1),
              ),
            ),
            itemCount: appointmentModel!.availableAppointments!.length,
          );
        } else {
          return SizedBox(
            height: screenHeight,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: Text("No data")),
          );
        }
      },
    );
  }
}
