import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/style.dart';
import 'package:dentech_smile/professor/Archive_professor_page/view/ProfessorArchiveWidgets/professor_archive_app_bar_title.dart';
import 'package:dentech_smile/professor/Archive_professor_page/view/ProfessorArchiveWidgets/professor_archive_list.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/view/Attendance%20Registration%20Widget/app_bar_back_arrow.dart';
import 'package:dentech_smile/professor/Case_professor_page/controller/case_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveProfessorPage extends StatefulWidget {
  final String studentId;
  final String sessionId;
  const ArchiveProfessorPage(
      {super.key, required this.studentId, required this.sessionId});

  @override
  State<ArchiveProfessorPage> createState() => _ArchiveProfessorPageState();
}

class _ArchiveProfessorPageState extends State<ArchiveProfessorPage> {
  @override
  void initState() {
    context.read<CaseCubit>().getDoctorArchive(
        int.parse(widget.studentId), int.parse(widget.sessionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white.withOpacity(0),
        backgroundColor: Colors.white,
        leading: const AppBarBackArrow(),
        title: const ProfessorArchiveAppBarTitle(),
      ),
      body: BlocListener<CaseCubit, CaseState>(
        listener: (context, state) {
          if (state is CaseFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        child: BlocBuilder<CaseCubit, CaseState>(
          builder: (context, state) {
            if (state is CaseSuccess) {
              final archiveDetails =
                  context.read<CaseCubit>().doctorArchiveModelList;
              return Stack(
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
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Styles.basicColor),
              );
            }
          },
        ),
      ),
    );

    // BlocConsumer<CaseCubit, CaseState>(
    //   listener: (context, state) {
    //     if (state is CaseFailure) {
    //       ScaffoldMessenger.of(
    //         context,
    //       ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
    //     }
    //   },
    //   builder: (context, state) {
    //     if (state is CaseSuccess) {
    //       final archiveDetails =
    //           context.read<CaseCubit>().doctorArchiveModelList;
    //       return Scaffold(
    //         backgroundColor: Colors.white,
    //         appBar: AppBar(
    //           backgroundColor: Colors.white,
    //           leading: AppBarBackArrow(),
    //           title: ProfessorArchiveAppBarTitle(),
    //         ),
    //         body: Stack(
    //           children: [
    //             Positioned.fill(
    //               child: SingleChildScrollView(
    //                 padding: EdgeInsets.only(
    //                   bottom: Static.gethieght(context, 80),
    //                 ),
    //                 child: ProfessorArchiveList(
    //                   doctorArchiveModelList: archiveDetails,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(color: Styles.basicColor),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
