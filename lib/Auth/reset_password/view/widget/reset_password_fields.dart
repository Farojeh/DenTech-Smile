import 'package:dentech_smile/Auth/reset_password/controller/cubit/reset_password_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordFields extends StatefulWidget {
  const ResetPasswordFields({super.key});

  @override
  State<ResetPasswordFields> createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {
  String? password;

  String? confirmpass;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn?TextDirection.ltr:TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                isEnglish: state.isEn ,
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
                  BlocProvider.of<ResetPasswordCubit>(context)
                      .setregisterpassword(p: password!);
                },
                obscureText: true,
                hint: state.isEn
                    ? "Enter your Password      "
                    : "ادخل كلمة المرور",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 10,
              ),
              CustomTextField(
                isEnglish: state.isEn ,
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
                  confirmpass = data;
                  if (confirmpass != password) {
                    throw "password not equal confirm password";
                  }
                },
                obscureText: true,
                hint: state.isEn
                    ? "Confirm Password"
                    : "تأكيد كلمة المرور",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
