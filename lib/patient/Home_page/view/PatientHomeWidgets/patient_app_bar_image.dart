import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
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
        width: Static.getwieght(context, 50),
        height: Static.gethieght(context, 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: size.width * 0.002),
        ),
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.notifications , extra: true);
          },
          child: Image.asset(
            'assets/images/ringing.png',
            width: Static.gethieght(context, 27),
            height: Static.gethieght(context, 27),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
