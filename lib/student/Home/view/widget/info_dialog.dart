import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_info_dialog.dart';
import 'package:dentech_smile/student/Home/view/widget/illness_info.dart';
import 'package:dentech_smile/student/Home/view/widget/medicines_info.dart';
import 'package:flutter/material.dart';

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
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  title(context, "assets/images/info.png",
                      "Aleen Morad Information"),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomInfoDialog(
                    title: "Patient Age",
                    child: "30 y",
                  ),
                  const CustomInfoDialog(
                      title: "Patient Hieght", child: "167 cm"),
                  const CustomInfoDialog(
                      title: "Patient Wieght", child: "67 kg"),
                  const SizedBox(
                    height: 15,
                  ),
                  title(context, "assets/images/ill.png", "Patient's diseases"),
                  const IllnessInfo(),
                  const SizedBox(
                    height: 15,
                  ),
                  title(context, "assets/images/syrup.png",
                      "Patient's Medicines"),
                  const MedicinesInfo()
                ])));
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
