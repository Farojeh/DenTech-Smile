import 'package:dentech_smile/student/qr_code/controller/cubit/qr_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrBody extends StatelessWidget {
  const QrBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCodeCubit, QrCodeState>(
      builder: (context, state) {
        if(state is QrCodeSuccess){
          return QrImageView(
          data: state.qrCode,
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        );
        }else{
          return Container();
        }
        
      },
    );
  }
}
