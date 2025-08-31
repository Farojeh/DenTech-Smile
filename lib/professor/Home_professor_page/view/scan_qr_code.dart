import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Scanner")),
      body: MobileScanner(
        onDetect: (capture) {
          bool res =
              BlocProvider.of<ProfessorHomeCubit>(context).scanData(capture);
          if (res) {
            Map<String, String> ids = {
              "sessionId": context.read<ProfessorHomeCubit>().sessionid,
              "studentId": context.read<ProfessorHomeCubit>().studentid
            };
            if (userInfo!.getInt(Static.userRole) != null &&
                userInfo!.getInt(Static.userRole) == 3) {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.caseProf, extra: ids);
            } else if (userInfo!.getInt(Static.userRole) == 4) {
              GoRouter.of(context)
                  .pushReplacement(AppRouter.archiveProf, extra: ids);
            }
          }
        },
      ),
    );
  }
}
