import 'package:dentech_smile/Auth/data_patient/view/widget/title_illness.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IlnessPage extends StatelessWidget {
  const IlnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height / 932) * 80,
            ),
            Image.asset(
              "assets/images/illness.png",
              height: (MediaQuery.of(context).size.height / 932) * 254,
              width: (MediaQuery.of(context).size.width / 430) * 345,
            ),
            const TitleIlness()
          ],
        );
      },
    );
  }
}
