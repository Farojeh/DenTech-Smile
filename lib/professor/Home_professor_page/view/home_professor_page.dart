import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_app_bar_image.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_app_bar_show_menu.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_app_bar_title.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_body_container.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_body_references.dart';
import 'package:dentech_smile/professor/Home_professor_page/view/HomeProfessorWidget/professor_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProfessorPage extends StatelessWidget {
  const HomeProfessorPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfessorHomeCubit>().changeSelectedIndex(0);
      context.read<ProfessorHomeCubit>().getWeeklySchedule();
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0),
        shadowColor: Colors.white.withOpacity(0),
        titleSpacing: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            ProfessorAppBarShowMenu(),
            SizedBox(
              width: 5,
            ),
            ProfessorAppBarTitle()
          ],
        ),
        actions: const [ProfessorAppBarImage()],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfessorBodyReferences(),
            SizedBox(
              height: 20,
            ),
            ProfessorBodyContainer(),
            SizedBox(
              height: 10,
            ),
            ProfessorSchedule(),
          ],
        ),
      ),
    );
  }
}
