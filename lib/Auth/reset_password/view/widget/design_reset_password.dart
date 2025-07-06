import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignResetPassword extends StatelessWidget {
  const DesignResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height / 932) * 60,
                  left: (MediaQuery.of(context).size.width / 430) * 30,
                  right: (MediaQuery.of(context).size.width / 430) * 30,
                  bottom: (MediaQuery.of(context).size.height / 932) * 35,
                ),
                child: Image.asset(
                  "assets/images/reset-password.png",
                  height: (MediaQuery.of(context).size.height / 932) * 278,
                  width: (MediaQuery.of(context).size.height / 932) * 278,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                state.isEn ? "Reset Password" : "اعادة وضع كلمة المرور",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w700,
                    fontSize: state.isEn
                        ? (MediaQuery.of(context).size.width / 430) * 35
                        : (MediaQuery.of(context).size.width / 430) * 32,
                    color: Static.basiccolor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  state.isEn
                      ? "Enter your new password, making sure it is strong and easy to remember"
                      : "أدخل كلمة المرور الجديدة، مع التأكد من أنها قوية وسهلة التذكر",
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 16
                          : (MediaQuery.of(context).size.width / 430) * 15,
                      color: Static.lightcolor),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}