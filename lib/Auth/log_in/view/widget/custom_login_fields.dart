import 'package:dentech_smile/Auth/log_in/controller/cubit/login_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginFields extends StatefulWidget {
  final bool patient;
  const CustomLoginFields({super.key, required this.patient});

  @override
  State<CustomLoginFields> createState() => _CustomLoginFieldsState();
}

class _CustomLoginFieldsState extends State<CustomLoginFields> {
  String? number;

  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 25,
            ),
            CustomTextField(
              isEnglish: state.isEn ? true : false,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20 ),
                child: Icon(
                  widget.patient
                      ? Icons.phone_in_talk
                      : Icons.privacy_tip_sharp,
                  color: Colors.black,
                  size: widget.patient ? 27 : 26,
                ),
              ),
              iscoupon: widget.patient ? null : true,
              isnumber: widget.patient ? true : null,
              height: (MediaQuery.of(context).size.height / 932) * 80,
              onsaved: (data) {
                number = data;
                BlocProvider.of<LoginCubit>(context)
                    .setregisternumber(n: number!);
              },
              hint: sethint(state.isEn, widget.patient),
              backgroundcolor: const Color(0xffF5F5F5),
              hintcolor: Static.lightcolor,
              hintsize: (MediaQuery.of(context).size.width / 430) * 16,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 10,
            ),
            CustomTextField(
              isEnglish: state.isEn ? true : false,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.password_sharp,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              height: (MediaQuery.of(context).size.height / 932) * 80,
              ispass: true,
              onsaved: (data) {
                password = data;
                BlocProvider.of<LoginCubit>(context)
                    .setregisterpassword(p: password!);
              },
              obscureText: true,
              hint: state.isEn
                  ? "     Enter your Password      "
                  : "     ادخل كلمة المرور      ",
              backgroundcolor: const Color(0xffF5F5F5),
              hintcolor: Static.lightcolor,
              hintsize: (MediaQuery.of(context).size.width / 430) * 16,
            ),
          ],
        );
      },
    );
  }

  String sethint(bool en, bool pat) {
    String hint;
    if (en) {
      pat
          ? hint = "     Enter your Number      "
          : hint = "     Enter the national number      ";
    } else {
      pat
          ? hint = "     ادخل رقم الموبايل      "
          : hint = "     ادخل الرقم الوطني      ";
    }
    return hint;
  }
}
