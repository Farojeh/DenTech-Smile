import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ProfessorScheduleBlock extends StatelessWidget {
  Schedules? schedules;

  ProfessorScheduleBlock({super.key, required this.schedules});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RegExp regExp = RegExp(r'^\d+');

    return InkWell(
      onTap: () async {
        GoRouter.of(
          context,
        ).push(AppRouter.attendanceRegistration, extra: schedules);
        context.read<ProfessorHomeCubit>().getPracticalScheduleStudents(
              schedules!.practical_id!,
            );
      },
      child: Container(
        width: (size.width / 430) * 362,
        height: (size.height / 932) * 100,
        margin: EdgeInsets.only(
          bottom: size.height * 0.018,
          right: size.width * 0.05,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: (size.width / 430) * 80,
              height: (size.height / 932) * 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                '# ${regExp.firstMatch(schedules!.from!)?.group(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: (MediaQuery.of(context).size.width / 430) * 30,
                ),
              ),
            ),
            SizedBox(width: size.width * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    schedules!.year!,
                    style: TextStyle(
                      fontFamily: Static.arialRoundedMTfont,
                      color: Colors.black,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 19,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${schedules!.from} → ${schedules!.to}',
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                      color:const Color.fromRGBO(40, 40, 40, 1),
                      fontSize: (MediaQuery.of(context).size.width / 430) * 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${schedules!.stage!} Internship",
                    style: TextStyle(
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(40, 40, 40, 1),
                      fontSize: (MediaQuery.of(context).size.width / 430) * 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
