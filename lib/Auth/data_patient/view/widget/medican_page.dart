import 'package:dentech_smile/Auth/data_patient/view/widget/title_medican.dart';
import 'package:flutter/material.dart';

class MedicanPage extends StatelessWidget {
  const MedicanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(height: (MediaQuery.of(context).size.height / 932) * 40,),
          Image.asset("assets/images/medican.png",
          height: (MediaQuery.of(context).size.height / 932) * 350,
          width: (MediaQuery.of(context).size.width / 430) * 350,
          ),
         const TitleMedican(),
        ],
      ),
    );
  }
}