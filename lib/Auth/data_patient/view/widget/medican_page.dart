import 'package:flutter/material.dart';

class MedicanPage extends StatelessWidget {
  const MedicanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: (MediaQuery.of(context).size.height / 932) * 60,),
        Image.asset("assets/images/medican.png",
        height: (MediaQuery.of(context).size.height / 932) * 350,
        width: (MediaQuery.of(context).size.width / 430) * 350,
        )
      ],
    );
  }
}