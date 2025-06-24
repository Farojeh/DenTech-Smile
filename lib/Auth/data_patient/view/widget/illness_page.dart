import 'package:dentech_smile/Auth/data_patient/view/widget/illness_body.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/title_illness.dart';
import 'package:flutter/material.dart';

class IlnessPage extends StatelessWidget {
  const IlnessPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        const TitleIlness(),
        const IllnessBody()
      ],
    );
  }
}
