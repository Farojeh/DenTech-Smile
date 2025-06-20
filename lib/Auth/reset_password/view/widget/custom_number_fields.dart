import 'package:dentech_smile/Auth/reset_password/controller/cubit/number_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNumberField extends StatefulWidget {
  const CustomNumberField({super.key});

  @override
  State<CustomNumberField> createState() => _CustomNumberFieldState();
}

class _CustomNumberFieldState extends State<CustomNumberField> {
  String? number;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, trstate) {
        return CustomTextField(
          isEnglish: trstate.isEn ? true : false,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.phone_in_talk,
              color: Colors.black,
              size: 25,
            ),
          ),
          isnumber: true,
          height: (MediaQuery.of(context).size.height / 932) * 70,
          onsaved: (data) {
            number = data;
            BlocProvider.of<NumberCubit>(context).setregisternumber(n: number!);
          },
          hint: trstate.isEn
              ? "  Enter your Number      "
              : "    ادخل رقم الموبايل   ",
          backgroundcolor: const Color(0xffF5F5F5),
          hintcolor: Static.lightcolor,
          hintsize: (MediaQuery.of(context).size.width / 430) * 15,
        );
      },
    );
  }
}
