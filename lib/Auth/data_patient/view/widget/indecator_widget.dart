import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndecatorWidget extends StatelessWidget {
  const IndecatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataPatientCubit, DataPatientState>(
      builder: (context, state) {
        return Container(
            alignment: Alignment.center,
            width: 55,
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: (index == state.selectPage) ? 16 : 11,
                      width: (index == state.selectPage) ? 16 : 11,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (index == state.selectPage)
                              ? Static.basiccolor
                              : Static.basiccolor.withOpacity(0.3)),
                    )));
      },
    );
  }
}
