import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/appointment_page_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_appointment_page.dart';
import 'package:dentech_smile/student/Home/view/widget/top_appointment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentPageCubit, AppointmentPageState>(
      listener: (context, state) {
        if(state is AppointmentPagefailure){
          Static.failure(context, state.errormessage);
        }else if(state is Appointmentsubfailure){
          Static.failure(context, state.errormessage);
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<AppointmentPageCubit, AppointmentPageState>(
            builder: (context, state) {
              if (state is AppointmentPageSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top + 7,
                      ),
                      const TopAppointmentPage(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Column(
                          children: state.appointments
                              .map((item) => Column(
                                    children: [
                                      CustomAppointmentPage(
                                        item: item,
                                      ),
                                      item.id !=
                                              state
                                                  .appointments[state
                                                          .appointments.length -
                                                      1]
                                                  .id
                                          ? const Divider(
                                              color: Colors.black,
                                            )
                                          : const SizedBox(
                                              height: 50,
                                            ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is AppointmentPageLoading) {
                return Static.loading();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
