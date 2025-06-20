import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPatientBody extends StatelessWidget {
  const DataPatientBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataPatientCubit, DataPatientState>(
      builder: (context, state) {
        final cubit = context.read<DataPatientCubit>();
        return PageView.builder(
            controller: cubit.controller,
            itemCount: state.pageArray.length,
            itemBuilder: (context, index) => state.pageArray[index]
        );
      },
    );
  }
}
