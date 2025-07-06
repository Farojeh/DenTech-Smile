import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/verify_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResendPasswordButton extends StatelessWidget {
  const ResendPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 40,
              ),
              Text(
                state.isEn ? "Don’t receive OTP?" : "الم تتلقى رمز التأكيد",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    fontSize: state.isEn
                        ? (MediaQuery.of(context).size.width / 430) * 17
                        : (MediaQuery.of(context).size.width / 430) * 15,
                    color: Static.lightcolor),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 5,
              ),
              InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: () async {
                  try {
                    var cubit = BlocProvider.of<VerifyCubit>(context);
                    await cubit.resendCode(
                        phonenumber: userInfo!.getString(Static.userNumber)!);
                  } catch (error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(CustomSnackBar().customSnackBar(
                          'Oops', error.toString(), ContentType.failure));
                  }
                },
                child: BlocBuilder<VerifyCubit, VerifyState>(
                  builder: (context, verstate) {
                    if (verstate is VerifyLoading) {
                      return SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Static.basiccolor,
                        ),
                      );
                    }
                    return Text(
                      state.isEn ? "Resend Code" : "اعادة ارسال الرمز",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 1,
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w700,
                        color: Static.basiccolor,
                        fontSize: state.isEn
                            ? (MediaQuery.of(context).size.width / 430) * 15
                            : (MediaQuery.of(context).size.width / 430) * 13,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 40,
              ),
            ],
          ),
        );
      },
    );
  }
}
