import 'package:dentech_smile/Auth/data_patient/view/widget/title_information.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height / 932) * 70,
          ),
          Image.asset(
            "assets/images/information.png",
            height: (MediaQuery.of(context).size.height / 932) * 300,
            width: (MediaQuery.of(context).size.width / 430) * 300,
          ),
          const TitleInformation()
        ],
      ),
    );
  }
}
