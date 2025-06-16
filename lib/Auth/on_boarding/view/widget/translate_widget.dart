import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TranslateWidget extends StatelessWidget {
  const TranslateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
        builder: (context, state) {
          final cubit = context.read<TranslationCubit>(); 
          return Transform.scale(
            scale: 1,
            child: Switch(
              value: state.isEn,
              onChanged: (nlan) {
                cubit.translate();
              },
              thumbIcon:const MaterialStatePropertyAll(Icon(Icons.translate,color: Colors.white , size: 11,)),
              activeColor: Colors.black,
              inactiveThumbColor: const Color.fromARGB(255, 72, 85, 88),
              inactiveTrackColor: const Color.fromARGB(212, 117, 118, 118),
            ),
          );
        },
      );
  }
}
