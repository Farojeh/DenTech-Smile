import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/controller/cubit/verify_edit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendPasswordButtonEdit extends StatelessWidget {
  const ResendPasswordButtonEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 40,
        ),
        Text(
          "Don’t receive OTP?",
          style: TextStyle(
              fontFamily: Static.afacadfont,
              fontWeight: FontWeight.w400,
              fontSize: (MediaQuery.of(context).size.width / 430) * 17,
              color: Static.lightcolor),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 5,
        ),
        InkWell(
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          onTap: () async {
            // try {
            //   var cubit = BlocProvider.of<VerifyCubit>(context);
            //   await cubit.resendCode(
            //       phonenumber: userInfo!.getString(Static.userNumber)!);
            // } catch (error) {
            //   ScaffoldMessenger.of(context)
            //     ..hideCurrentSnackBar()
            //     ..showSnackBar(CustomSnackBar().customSnackBar(
            //         'Oops', error.toString(), ContentType.failure));
            // }
          },
          child: BlocBuilder<VerifyEditCubit, VerifyEditState>(
            builder: (context, verstate) {
              if (verstate is VerifyEditLoading) {
                return SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Static.basiccolor,
                  ),
                );
              }
              return Text(
                "Resend Code",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1,
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w700,
                  color: Static.basiccolor,
                  fontSize: (MediaQuery.of(context).size.width / 430) * 15,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height / 932) * 40,
        ),
      ],
    );
  }
}
