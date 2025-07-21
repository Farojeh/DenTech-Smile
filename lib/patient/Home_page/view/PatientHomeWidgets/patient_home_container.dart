import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientHomeContainer extends StatelessWidget {
  const PatientHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.85 > 350 ? 350 : size.width * 0.85,
        height: size.height * 0.25 > 190 ? 190 : size.height * 0.25,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Component20.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: size.height * 0.04 > 30 ? 30 : size.height * 0.04,
                left: size.width * 0.05 > 20 ? 20 : size.width * 0.05,
                child: Text(
                  context.watch<ThemeCubit>().isArabic
                      ? Lang.arabLang["Archive_status"]!
                      : Lang.enLang["Archive_status"]!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05 > 20 ? 20 : size.width * 0.05,
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.08 > 65 ? 65 : size.height * 0.08,
                left: size.width * 0.012 > 5 ? 5 : size.width * 0.012,
                right: size.width * 0.42 > 155 ? 155 : size.width * 0.42,
                child: Text(
                  context.watch<ThemeCubit>().isArabic
                      ? Lang.arabLang["follow"]!
                      : Lang.enLang["follow"]!,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 74, 74, 74),
                    fontSize: size.width * 0.03 > 13 ? 13 : size.width * 0.03,
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.04 > 30 ? 30 : size.height * 0.04,
                left: size.width * 0.05 > 20 ? 20 : size.width * 0.05,
                width: size.width * 0.3 > 117 ? 117 : size.width * 0.3,
                height: size.height * 0.05 > 38 ? 38 : size.height * 0.05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.karchive);
                  },
                  child: Text(
                    context.watch<ThemeCubit>().isArabic
                        ? Lang.arabLang["Archive"]!
                        : Lang.enLang["Archive"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.04 > 15 ? 15 : size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
