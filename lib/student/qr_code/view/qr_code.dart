import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/qr_code/controller/cubit/qr_code_cubit.dart';
import 'package:dentech_smile/student/qr_code/view/widget/qr_body.dart';
import 'package:dentech_smile/student/qr_code/view/widget/qr_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrCodeCubit>(
      create: (context) => QrCodeCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BlocBuilder<QrCodeCubit, QrCodeState>(
            builder: (context, state) {
              if (state is QrCodeSuccess) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 20,
                    ),
                    const QrDesign(),
                    const SizedBox(height: 40),
                    const QrBody(),
                  ],
                );
              } else if (state is QrCodeLoading) {
                return Static.loading();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
