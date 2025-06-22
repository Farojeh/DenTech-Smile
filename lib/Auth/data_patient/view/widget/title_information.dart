import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleInformation extends StatelessWidget {
  const TitleInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.isEn ? "Please enter " : "الرجاء قم بادخال ",
                  style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: state.isEn ? FontWeight.w500 : FontWeight.w700,
                    color: Colors.black,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 20,
                  ),
                ),
                Text(
                  state.isEn ? "personal information " : "بياناتك الشخصية ",
                  style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: state.isEn ? FontWeight.w500 : FontWeight.w700,
                    color: Static.basiccolor,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 20,
                  ),
                ),
                Text(
                  state.isEn ? "accurately " : "بدقة ",
                  style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontWeight: state.isEn ? FontWeight.w500 : FontWeight.w700,
                    color: Colors.black,
                    fontSize: (MediaQuery.of(context).size.width / 430) * 20,
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
