import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignVerify extends StatelessWidget {
  const DesignVerify({super.key});

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
                  top: (MediaQuery.of(context).size.height / 932) * 50,
                  left: (MediaQuery.of(context).size.width / 430) * 30,
                  right: (MediaQuery.of(context).size.width / 430) * 30,
                  bottom: (MediaQuery.of(context).size.height / 932) * 40,
                ),
                child: Image.asset(
                  "assets/images/verify.png",
                  height: (MediaQuery.of(context).size.height / 932) * 278,
                  width: (MediaQuery.of(context).size.height / 932) * 278,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                state.isEn ? "Verify Code" : "شيفرة التحقق",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w700,
                    fontSize: state.isEn
                        ? (MediaQuery.of(context).size.width / 430) * 35
                        : (MediaQuery.of(context).size.width / 430) * 32,
                    color: Static.basiccolor),
              ),
              Text(
                state.isEn
                    ? "Please enter the code sent to your email"
                    : "الرجاء إدخال الرمز المرسل إلى رقمك الخاص",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    fontSize: state.isEn
                        ? (MediaQuery.of(context).size.width / 430) * 16
                        : (MediaQuery.of(context).size.width / 430) * 15,
                    color: Static.lightcolor),
              )
            ],
          ),
        );
      },
    );
  }
}
