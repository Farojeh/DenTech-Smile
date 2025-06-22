import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Buttonpart extends StatelessWidget {
  const Buttonpart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 15,
            ),
            CustomButton(
              color: Static.basiccolor,
              redbl: 20,
              redbr: 20,
              redtl: 20,
              redtr: 20,
              height: (MediaQuery.of(context).size.height / 932) * 55,
              elevation: 7,
              width: (MediaQuery.of(context).size.width / 430) * 247,
              onPressed: () {
                userInfo!.setInt(Static.userRole, 2);
                GoRouter.of(context).push(AppRouter.signUp);
              },
              child: Text(
                state.isEn ? "Patient" : "مريض",
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: FontWeight.w700,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 20,
            ),
            CustomButton(
                color: Colors.white,
                side: Static.basiccolor,
                redbl: 20,
                redbr: 20,
                redtl: 20,
                redtr: 20,
                elevation: 7,
                height: (MediaQuery.of(context).size.height / 932) * 55,
                width: (MediaQuery.of(context).size.width / 430) * 247,
                onPressed: () {
                  userInfo!.setInt(Static.userRole, 1);
                  GoRouter.of(context).push(AppRouter.login);
                },
                child: Text(
                  state.isEn ? "Student" : "طالب",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w700,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                      color: Static.basiccolor),
                )),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 20,
            ),
            CustomButton(
                color: Colors.white,
                side: Static.basiccolor,
                redbl: 20,
                redbr: 20,
                redtl: 20,
                redtr: 20,
                elevation: 7,
                height: (MediaQuery.of(context).size.height / 932) * 55,
                width: (MediaQuery.of(context).size.width / 430) * 247,
                onPressed: () {
                  userInfo!.setInt(Static.userRole, 4);
                  GoRouter.of(context).push(AppRouter.login);
                },
                child: Text(
                  state.isEn ? "Professor" : "استاذ جامعي",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w700,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                      color: Static.basiccolor),
                )),
          ],
        );
      },
    );
  }
}
