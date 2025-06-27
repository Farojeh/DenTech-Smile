import 'package:dentech_smile/Auth/data_patient/controller/cubit/illness_cubit_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IllnessBody extends StatelessWidget {
  const IllnessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, trstate) {
        return Directionality(
          textDirection:trstate.isEn? TextDirection.ltr:TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.035),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            height: (MediaQuery.of(context).size.height / 932) * 325,
            width: (MediaQuery.of(context).size.width / 430) * 345,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5, color: Static.basiccolor)),
            alignment: Alignment.topCenter,
            child: BlocBuilder<IllnessCubitCubit, IllnessCubitState>(
                builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: state.illnesses.asMap().entries.map((entry) {
                  final index = entry.key;
                  final illness = entry.value;
                  return SizedBox(
                      height: (MediaQuery.of(context).size.height / 932) * 43,
                      child: Row(
                        children: [
                          Checkbox(
                            value: illness.active,
                            activeColor: const Color(0xff3EAEB6),
                            onChanged: (_) {
                              context
                                  .read<IllnessCubitCubit>()
                                  .toggleIllness(index);
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                           trstate.isEn? illness.enname:illness.arname,
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontSize:
                                    (MediaQuery.of(context).size.width / 430) *
                                        20,
                                fontWeight:trstate.isEn? FontWeight.w400 : FontWeight.w500),
                          ),
                        ],
                      ));
                }).toList(),
              );
            }),
          ),
        );
      },
    );
  }
}
