import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/lang.dart';
import 'package:dentech_smile/core/utils/static.dart';
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
        height: Static.gethieght(context, 230),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
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
                left: Static.getwieght(context, 30),
                child: Text(
                  context.watch<ThemeCubit>().isArabic
                      ? Lang.arabLang["Archive_status"]!
                      : Lang.enLang["Archive_status"]!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Static.getwieght(context, 25),
                    fontFamily: 'Afacad',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                top: Static.gethieght(context, 82),
                left: size.width * 0.012 > 5 ? 5 : size.width * 0.012,
                right: size.width * 0.46 > 155 ? 155 : size.width * 0.46,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    context.watch<ThemeCubit>().isArabic
                        ? Lang.arabLang["follow"]!
                        : Lang.enLang["follow"]!,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 74, 74, 74),
                      fontSize: Static.getwieght(context, 16),
                      fontFamily: 'Afacad',
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: context.watch<ThemeCubit>().isArabic
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                bottom: Static.gethieght(context, 37),
                left: Static.getwieght(context, 30),
                width: size.width * 0.3 > 117 ? 117 : size.width * 0.3,
                height: size.height * 0.05 > 38 ? 38 : size.height * 0.05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), 
                    ),
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
