import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopLoginPage extends StatelessWidget {
  const TopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 22,
            ),
            Text(
             state.isEn? "Welcome Back !":"أهلا بك مجددا",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontSize:state.isEn? (MediaQuery.of(context).size.width / 430) * 35:(MediaQuery.of(context).size.width / 430) * 30,
                  fontWeight: FontWeight.w700,
                  color: Static.basiccolor),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.15),
              child: Text(
               state.isEn? "welcome back again in DenTeck smile as student":"مرحبا بك مرة اخرى في تطبيقنا يرجى ادخال الرقم وكلمة المرور",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: Static.afacadfont,
                    fontSize:state.isEn? (MediaQuery.of(context).size.width / 430) * 16:(MediaQuery.of(context).size.width / 430) * 14,
                    fontWeight: FontWeight.w400,
                    color: Static.lightcolor),
              ),
            ),
          ],
        );
      },
    );
  }
}
