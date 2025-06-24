import 'package:dentech_smile/Auth/data_patient/controller/cubit/information_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/custom_iformation_fields.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/title_information.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 70,
              ),
              Image.asset(
                "assets/images/information.png",
                height: (MediaQuery.of(context).size.height / 932) * 300,
                width: (MediaQuery.of(context).size.width / 430) * 300,
              ),
              const TitleInformation(),
              BlocBuilder<InformationCubit, InformationState>(
                builder: (context, state) {
                  final cubit = context.read<InformationCubit>();
                  return Form(
                      autovalidateMode: cubit.autovalidateMode,
                      key: cubit.formkey,
                      child: const CustomInformationFields());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
