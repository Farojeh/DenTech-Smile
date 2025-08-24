import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Archive_professor_page/view/ProfessorArchiveWidgets/professor_archive_app_bar_title.dart';
import 'package:dentech_smile/professor/Archive_professor_page/view/ProfessorArchiveWidgets/professor_archive_list.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveProfessorPage extends StatelessWidget {
  const ArchiveProfessorPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<CaseCubit>().getDoctorArchive(1, 1),
    );
    return BlocConsumer<CaseCubit, CaseState>(
      listener: (context, state) {
        if (state is CaseFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        if (state is CaseSuccess) {
          final archiveDetails =
              context.read<CaseCubit>().doctorArchiveModelList;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: AppBarBackArrow(),
              title: ProfessorArchiveAppBarTitle(),
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: Static.gethieght(context, 80),
                    ),
                    child: ProfessorArchiveList(
                      doctorArchiveModelList: archiveDetails,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Styles.basicColor),
            ),
          );
        }
      },
    );
  }
}
