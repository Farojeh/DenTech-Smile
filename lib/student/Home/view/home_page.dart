import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/appointment_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/days_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/top_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 7,
              ),
              const TopHomeView(),
              const AppointmentWidget(),
              const DayWidget()
            ],
          ),
        ),
      )),
    );
  }
}
