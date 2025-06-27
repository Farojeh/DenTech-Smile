import 'package:dentech_smile/Auth/data_patient/view/widget/medican_body.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/title_medican.dart';
import 'package:flutter/material.dart';

class MedicanPage extends StatefulWidget {
  const MedicanPage({super.key});

  @override
  State<MedicanPage> createState() => _MedicanPageState();
}

class _MedicanPageState extends State<MedicanPage> {
  int x = 6;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height / 932) * 50,
          ),
          Image.asset(
            "assets/images/medican.png",
            height: (MediaQuery.of(context).size.height / 932) * 350,
            width: (MediaQuery.of(context).size.width / 430) * 350,
          ),
          const TitleMedican(),
          const SizedBox(
            height: 15,
          ),
          const MedicanBody()
        ],
      ),
    );
  }
}
