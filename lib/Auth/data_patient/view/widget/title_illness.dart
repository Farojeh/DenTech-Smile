import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleIlness extends StatelessWidget {
  const TitleIlness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
           textDirection:state.isEn?TextDirection.ltr: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !state.isEn? "الرجاء تحديد ":"Please specify ",
                      style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight:state.isEn?FontWeight.w500 :FontWeight.w700,
                        color: Colors.black,
                        fontSize:!state.isEn? (MediaQuery.of(context).size.width / 430) * 21:(MediaQuery.of(context).size.width / 430) * 20,
                      ),
                    ),
                    Text(
                     !state.isEn? "الأمراض ":"the diseases ",
                      style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight:state.isEn?FontWeight.w500 :FontWeight.w700,
                        color: Static.basiccolor,
                        fontSize:!state.isEn? (MediaQuery.of(context).size.width / 430) * 21:(MediaQuery.of(context).size.width / 430) * 20,
                      ),
                    ),
                    Text(
                     !state.isEn? "التي تعاني منها ":"you suffer from",
                      style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight:state.isEn?FontWeight.w500 :FontWeight.w700,
                        color: Colors.black,
                       fontSize:!state.isEn? (MediaQuery.of(context).size.width / 430) * 21:(MediaQuery.of(context).size.width / 430) * 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
