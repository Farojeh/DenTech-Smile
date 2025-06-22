import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleMedican extends StatelessWidget {
  const TitleMedican({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.isEn ? "Please take photos " : "الرجاء التقاط صور ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Colors.black,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  ),
                  Text(
                    state.isEn ? "of medications " : "للادوية الطبية ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Static.basiccolor,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  ),
                  Text(
                    state.isEn ? "you are " : "التي تتناولها ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Colors.black,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.isEn ? "taking ,showing " : "بحيث تظهر ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Colors.black,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  ),
                  Text(
                    state.isEn ? "brand name " : "الاسم التجاري ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Static.basiccolor,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  ),
                  Text(
                    state.isEn ? "or " : "او ",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Colors.black,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  ),
                  Text(
                    state.isEn ? "generic name " : "الاسم العلمي",
                    style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight:
                          state.isEn ? FontWeight.w500 : FontWeight.w700,
                      color: Static.basiccolor,
                      fontSize: !state.isEn
                          ? (MediaQuery.of(context).size.width / 430) * 21
                          : (MediaQuery.of(context).size.width / 430) * 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
