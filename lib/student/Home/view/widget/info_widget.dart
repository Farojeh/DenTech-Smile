import 'package:dentech_smile/student/Home/view/widget/custom_title.dart';
import 'package:dentech_smile/student/Home/view/widget/info_dialog.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomTitle(
      image: "assets/images/info.png",
      title: "Aleen Morad",
      more: "Show Info",
      ismore: true,
      onTapfun: () {
        showDialog(
        context: context,
        builder: (context) =>const InfoDialog(),
      );
      },
    );
  }
}
