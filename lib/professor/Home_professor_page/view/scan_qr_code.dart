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
        bool res = BlocProvider.of<ProfessorHomeCubit>(context).scanData(capture);
        if(res){
          GoRouter.of(context).pop();
        }
        },
      ),
    );
  }
}
