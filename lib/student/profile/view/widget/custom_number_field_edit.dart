import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/controller/cubit/number_edit_dialog_cubit.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNumberFieldEdit extends StatefulWidget {
  const CustomNumberFieldEdit({super.key});

  @override
  State<CustomNumberFieldEdit> createState() => _CustomNumberFieldState();
}

class _CustomNumberFieldState extends State<CustomNumberFieldEdit> {
  String? number;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isEnglish: true,
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
        BlocProvider.of<NumberEditDialogCubit>(context).setnumber(n: number!);
      },
      hint: "  Enter your Number      ",
      backgroundcolor: const Color(0xffF5F5F5),
      hintcolor: Static.lightcolor,
      hintsize: (MediaQuery.of(context).size.width / 430) * 15,
    );
  }
}
