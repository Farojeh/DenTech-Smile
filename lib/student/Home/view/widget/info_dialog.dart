import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/patient_info_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_info_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/illness_info.dart';
import 'package:dentech_smile/student/Home/view/widget/medicines_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: BlocBuilder<PatientInfoCubit, PatientInfoState>(
              builder: (context, state) {
                if (state is PatientInfoSuccess) {
                  return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        title(context, "assets/images/info.png",
                            "Patient Information"),
                        const SizedBox(
                          height: 15,
                        ),
                         CustomInfoDialog(
                          title: "Patient Age",
                          child: state.age,
                        ),
                         CustomInfoDialog(
                            title: "Patient Hieght", child: "${state.height} m"),
                         CustomInfoDialog(
                            title: "Patient Wieght", child: "${state.wieght} kg"),
                        const SizedBox(
                          height: 15,
                        ),
                        title(context, "assets/images/ill.png",
                            "Patient's diseases"),
                         IllnessInfo(illness: state.ilness,),
                        const SizedBox(
                          height: 15,
                        ),
                        title(context, "assets/images/syrup.png",
                            "Patient's Medicines"),
                         MedicinesInfo(images: state.images,)
                      ]);
                } else if (state is PatientInfoLoading) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Static.basiccolor,
                      )
                    ],
                  );
                } else if (state is PatientInfofailure) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(state.errormessage)],
                  );
                } else {
                  return Container();
                }
              },
            )));
  }

  Widget title(BuildContext context, String image, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: Static.arialRoundedMTfont,
              fontSize: Static.getwieght(context, 19),
              color: Colors.black),
        ),
      ],
    );
  }
}
