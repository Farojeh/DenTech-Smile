import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/controller/cubit/verify_edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class PinEditWidget extends StatelessWidget {
  const PinEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Pin is incomplete";
        }
        return null;
      },
      onChanged: (value) {
        BlocProvider.of<VerifyEditCubit>(context).setverifyotp(n: value);
      },
      onCompleted: (value) {},
      errorBuilder: (errorText, pin) {
        return Text(
          errorText ?? "",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent),
        );
      },
    );
  }
}
