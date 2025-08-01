import 'package:dentech_smile/student/exchange/controller/cubit/add_resource_cubit.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResourceField extends StatefulWidget {
  const CustomResourceField({super.key});

  @override
  State<CustomResourceField> createState() => _CustomResourceFieldState();
}

class _CustomResourceFieldState extends State<CustomResourceField> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45, top: 15, bottom: 4),
      child: CustomTextField(
        isEnglish: true,
        iscoupon: true,
        height: (MediaQuery.of(context).size.height / 932) * 70,
        onsaved: (data) {
          title = data;
          if (title != null) {
            BlocProvider.of<AddResourceCubit>(context).setname(title!);
          }
        },
        backgroundcolor: const Color(0xffF5F5F5),
      ),
    );
  }
}
