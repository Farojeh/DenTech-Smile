import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn?TextDirection.ltr:TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(
              top:state.isEn? (MediaQuery.of(context).size.height / 932) * 23:(MediaQuery.of(context).size.height / 932) * 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.isEn?"Already have an account?":"انا املك حسابا مسبقا ؟ ",
                  style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w400,
                    color: Static.lightcolor,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 16,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  overlayColor:
                      MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.login, extra: true),
                  child: Text(
                   state.isEn? "Login": "تسجيل الدخول",
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
              ],
            ),
          ),
        );
      },
    );
  }
}
