import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_schedule_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ProfessorScheduleList extends StatelessWidget {
  const ProfessorScheduleList({super.key});

  ////ايندكس الليست و السينتر والفاضي

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ProfessorHomeCubit, ProfessorHomeState>(
      listener: (context, state) {
        if (state is ProfessorHomeFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is ProfessorSchaduleLoading) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: CircularProgressIndicator(color: Styles.basicColor),
            ),
          );
        } else if (state is ProfessorHomeSuccess) {
          final List<Schedules> daySchedule =
              context.read<ProfessorHomeCubit>().daysSchedules[
                  context.read<ProfessorHomeCubit>().daysSelectedIndex];
          return daySchedule.isEmpty
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Center(
                    child: Text(
                      'There is no session yet',
                      style: TextStyle(
                        fontFamily: 'ArialRounded',
                        fontWeight: FontWeight.w400,
                        color: Styles.basicColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: daySchedule.length,
                    itemBuilder: (context, index) {
                      return ProfessorScheduleBlock(
                        schedules: daySchedule[index],
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'There is no session yet',
                style: TextStyle(
                  fontFamily: 'ArialRounded',
                  fontWeight: FontWeight.w400,
                  color: Styles.basicColor,
                  fontSize: 18,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
