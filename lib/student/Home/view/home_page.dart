import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:dentech_smile/student/Home/view/drawer.dart';
import 'package:dentech_smile/student/Home/view/widget/appointment_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/days_widget.dart';
import 'package:dentech_smile/student/Home/view/widget/top_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeFailure) {
                Static.failure(context, state.errormessage);
              }
            },
            child: InkWell(
              overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
              onTap: () => StaticDrawer.close(context),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await context.read<HomeCubit>().initialhome();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top + 7,
                        ),
                        const TopHomeView(),
                        const AppointmentWidget(),
                        const DayWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
