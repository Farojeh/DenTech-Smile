import 'package:dentech_smile/Auth/reset_password/controller/cubit/number_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/number_dialog.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(right: 30 , top: 1),
          alignment: Alignment.centerRight,
          child: InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => BlocProvider<NumberCubit>(
                        create: (context) => NumberCubit(),
                        child:const NumberDialg(),
                      ));
            },
            child: Text(
              state.isEn ? "Forget Password ?" : "هل نسيت كلمة المرور ؟",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1,
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
