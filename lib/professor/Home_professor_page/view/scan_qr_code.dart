import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/professor/Home_professor_page/controller/professor_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool _isScanned = false; // فلاج للتأكد أنه ما يتكرر

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Scanner")),
      body: MobileScanner(
        onDetect: (capture) {
          if (_isScanned) return; // تجاهل أي قراءة إضافية

          bool res = context.read<ProfessorHomeCubit>().scanData(capture);
          if (res) {
            setState(() {
              _isScanned = true; // قفل القراءة بعد أول نجاح
            });

            Map<String, String> ids = {
              "sessionId": context.read<ProfessorHomeCubit>().sessionid,
              "studentId": context.read<ProfessorHomeCubit>().studentid
            };

            if (userInfo!.getInt(Static.userRole) == 3) {
              GoRouter.of(context).pushReplacement(
                AppRouter.caseProf,
                extra: ids,
              );
            } else if (userInfo!.getInt(Static.userRole) == 4) {
              GoRouter.of(context).pushReplacement(
                AppRouter.archiveProf,
                extra: ids,
              );
            }
          }
        },
      ),
    );
  }
}
