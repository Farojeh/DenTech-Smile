import 'package:dentech_smile/Auth/on_boarding/view/widget/button_part.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/top_role_page.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TranslationCubit, TranslationState>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Toprolepage(),
                Text(
                 state.isEn? "Join with us As":"انضم الى مجتمعنا ",
                  style: TextStyle(
                      fontFamily: Static.abhayaLibrefont,
                      fontSize:state.isEn? (MediaQuery.of(context).size.width / 430) * 33:(MediaQuery.of(context).size.width / 430) * 28
                      ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                   state.isEn? "Choose the role you want to register to in the application":"اختر الدور الذي تريد التسجيل فيه في التطبيق",
                    style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        fontSize:
                            (MediaQuery.of(context).size.width / 430) * 18,
                        color: Static.lightcolor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Buttonpart(),
              ],
            ),
          );
        },
      ),
    );
  }
}
