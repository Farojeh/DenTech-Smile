import 'package:dentech_smile/core/utils/static.dart';
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
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is PatientAppointmentSuccess) {
          final appointmentModel = state.appointmentModel;
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: Static.getwieght(context, 30),
              vertical: 0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(
                vertical: Static.gethieght(context, 7),
              ),
              child: Column(
                children: [
                  PatientAppointmentsBlock(
                    appointments:
                        appointmentModel.availableAppointments![index],
                  ),
                  Divider(thickness: 0.5, indent: 10, color: Static.basiccolor),
                ],
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
