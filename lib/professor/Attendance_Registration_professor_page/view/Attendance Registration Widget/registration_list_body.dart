import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/registration_body_block.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegistrationListBody extends StatelessWidget {
  const RegistrationListBody({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 34);
    return BlocConsumer<ProfessorHomeCubit, ProfessorHomeState>(
      listener: (context, state) {
        if (state is ProfessorHomeFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is ProfessorHomeSuccess) {
          // final practicalStudent = state.practicalModel;
          final student =
              context.read<ProfessorHomeCubit>().practicalModel!.students ?? [];

          return student.isEmpty
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const Center(
                    child: Text(
                      'There is no Students yet',
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
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: student.length,
                    separatorBuilder: (context, index) =>
                        Divider(color: Color.fromRGBO(133, 177, 188, 1)),
                    itemBuilder: (context, index) {
                      return RegistrationBodyBlock(
                        isCheck: context
                            .read<ProfessorHomeCubit>()
                            .checkedList[index],
                        index: index,
                        studentsPractical: student[index],
                      );
                    },
                  ),
                );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
