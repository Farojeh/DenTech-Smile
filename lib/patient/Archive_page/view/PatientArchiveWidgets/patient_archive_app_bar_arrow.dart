import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientArchiveAppBarArrow extends StatelessWidget {
  const PatientArchiveAppBarArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.005,
        bottom: screenHeight * 0.015,
        right: context.watch<ThemeCubit>().isArabic? screenWidth * 0.035:0,
        left: context.watch<ThemeCubit>().isArabic?0:screenWidth * 0.035,
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          width: screenWidth * 0.04,
          height: screenWidth * 0.04,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.24),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.51),
              width: 0.5,
            ),
          ),
          alignment: Alignment.center,
          child: Image.asset(
           context.watch<ThemeCubit>().isArabic? 'assets/images/Vector.png':"assets/images/arrow_back_white.png",
           color: Colors.black,
            width: screenWidth * 0.04,
            height: screenWidth * 0.04,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
