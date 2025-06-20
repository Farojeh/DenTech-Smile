import 'package:dentech_smile/Auth/reset_password/controller/cubit/verify_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection:state.isEn?TextDirection.ltr:TextDirection.rtl ,
          child: Pinput(
            length: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Pin is incomplete";
              }
              return null;
            },
            onChanged: (value) {
              BlocProvider.of<VerifyCubit>(context).setverifyotp(n: value);
            },
            onCompleted: (value) {
            },
            errorBuilder: (errorText, pin) {
              return Text(errorText??"",
              style: TextStyle(
                fontFamily: Static.afacadfont,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.redAccent
              ),
              );
            },
          ),
        );
      },
    );
  }
}
