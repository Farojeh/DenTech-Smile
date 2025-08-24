import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/model/practical-schedule-students_model.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegistrationBodyBlock extends StatelessWidget {
  final bool isCheck;
  final int index;
  StudentsPractical? studentsPractical;

  RegistrationBodyBlock({
    super.key,
    required this.isCheck,
    required this.index,
    required this.studentsPractical,
  });

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 7);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Row(
        children: [
          Checkbox(
            value: isCheck,
            onChanged: (value) {
              context.read<ProfessorHomeCubit>().addToIdList(
                    studentsPractical!.studentId!,
                  );
              context.read<ProfessorHomeCubit>().changeChecked(index, value!);
            },
          ),
          Text(
            studentsPractical!.name!,
            style: TextStyle(
              fontFamily: 'Afacad',
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: Static.getwidth(context, 22),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
