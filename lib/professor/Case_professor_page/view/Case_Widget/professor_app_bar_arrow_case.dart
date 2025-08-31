import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ProfessorAppBarArrowCase extends StatelessWidget {
  const ProfessorAppBarArrowCase({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontal = Static.getwidth(context, 15);
    double vertical = Static.getheight(context, 15);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          width: Static.getwidth(context, 42),
          height: Static.getheight(context, 42),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(190, 190, 190, 0.24),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 0.5),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/arrow_back_white.png',
            width: Static.getwidth(context, 13),
            height: Static.getheight(context, 18),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
