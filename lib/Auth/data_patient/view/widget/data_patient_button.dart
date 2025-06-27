import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_config_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/data_patient_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/illness_cubit_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/information_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/controller/cubit/medican_cubit.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/indecator_widget.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataPatientButton extends StatelessWidget {
  const DataPatientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
            onTap: () =>
                BlocProvider.of<DataPatientCubit>(context).previousPage(),
            child: Container(
              height: (MediaQuery.of(context).size.height / 932) * 60,
              width: (MediaQuery.of(context).size.height / 932) * 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 2.5, color: Static.basiccolor)),
              child: Icon(
                Icons.arrow_back,
                color: Static.basiccolor,
                size: 30,
              ),
            ),
          ),
          const IndecatorWidget(),
          BlocBuilder<DataPatientCubit, DataPatientState>(
            builder: (context, state) {
              return InkWell(
                overlayColor:
                    MaterialStatePropertyAll(Colors.white.withOpacity(0)),
                onTap: ()async {
                  final cubit = context.read<InformationCubit>();
                  final medcuibit = context.read<MedicanCubit>();
                  final illcubit = context.read<IllnessCubitCubit>();
                  final configcubit = context.read<DataPatientConfigCubit>();
                  if (state.selectPage < 2) {
                    BlocProvider.of<DataPatientCubit>(context).nextPage();
                  } else {
                    if (cubit.formkey.currentState!.validate()) {
                      try {
                        cubit.formkey.currentState!.save();
                        if (cubit.checkdate()) {
                          throw "Age is Required";
                        }
                       await configcubit.configData(
                            illness: illcubit.activeillnesses,
                            images: medcuibit.images,
                            date: cubit.age,
                            hieght: cubit.hieght,
                            wieght: cubit.wieght);
                      } catch (error) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(CustomSnackBar().customSnackBar(
                              'Oops', error.toString(), ContentType.failure));
                      }
                    } else {
                      cubit.check(aut: AutovalidateMode.always);
                    }
                  }
                },
                child: Container(
                  height: (MediaQuery.of(context).size.height / 932) * 60,
                  width: (MediaQuery.of(context).size.height / 932) * 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Static.basiccolor,
                  ),
                  child: BlocBuilder<DataPatientConfigCubit,
                      DataPatientConfigState>(
                    builder: (context, state) {
                      if (state is DataPatientConfigLoading) {
                        return const Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      return const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 30,
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
