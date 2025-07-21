import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientAppBarImage extends StatelessWidget {
  const PatientAppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
        top: size.height * 0.01,
      ),
      child: Container(
        width: size.width * 0.12,
        height: size.width * 0.12,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: size.width * 0.002),
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.notifications);
          },
          child: Image.asset(
            'assets/images/ringing.png',
            width: size.width * 0.065,
            height: size.width * 0.065,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
