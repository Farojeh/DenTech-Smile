import 'package:dentech_smile/Auth/log_in/controller/cubit/login_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginFields extends StatefulWidget {
  const CustomLoginFields({super.key});

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
              height: (MediaQuery.of(context).size.height / 932) * 20,
            ),
            CustomTextField(
              isEnglish:state.isEn? true:false,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.phone_in_talk,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              iscoupon: true,
              height: (MediaQuery.of(context).size.height / 932) * 80,
              onsaved: (data) {
                number = data;
                BlocProvider.of<LoginCubit>(context)
                    .setregisternumber(n: number!);
              },
              hint:state.isEn? "     Enter your Number      ":"    ادخل رقم الموبايل      ",
              backgroundcolor: const Color(0xffF5F5F5),
              hintcolor: Static.lightcolor,
              hintsize: (MediaQuery.of(context).size.width / 430) * 16,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 5,
            ),
            CustomTextField(
              isEnglish:state.isEn? true:false,
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
              hint:state.isEn? "     Enter your Password      ":"     ادخل كلمة المرور      ",
              backgroundcolor: const Color(0xffF5F5F5),
              hintcolor: Static.lightcolor,
              hintsize: (MediaQuery.of(context).size.width / 430) * 16,
            ),
          ],
        );
      },
    );
  }
}
