import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/description_cubit.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDescField extends StatefulWidget {
  final String init;
  const CustomDescField({super.key, required this.init});

  @override
  State<CustomDescField> createState() => _CustomDescFieldState();
}

class _CustomDescFieldState extends State<CustomDescField> {
  String? desc;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isEnglish: true,
      iscoupon: true,
      height: (MediaQuery.of(context).size.height / 932) * 260,
      onsaved: (data) {
        desc = data;
        BlocProvider.of<DescriptionCubit>(context).setdesc(n: desc!);
      },
      maxline: 14,
      initialValue: widget.init,
      initstyle: TextStyle(
          fontFamily: Static.afacadfont,
          fontWeight: FontWeight.w400,
          fontSize: Static.getwieght(context, 15),
          color: Colors.black),
      backgroundcolor: const Color(0xffF5F5F5),
    );
  }
}
