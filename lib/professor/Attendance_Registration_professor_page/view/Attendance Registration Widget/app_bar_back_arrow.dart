import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class AppBarBackArrow extends StatelessWidget {
  const AppBarBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Static.getheight(context, 8),
        bottom: Static.getheight(context, 8),
        left: Static.getwidth(context, 15),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).maybePop();
        },
        child: Container(
          width: Static.getwidth(context, 42),
          height: Static.getheight(context, 42),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(81, 81, 81, 0.24),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.51),
              width: 0.5,
            ),
          ),
          alignment: Alignment.center,
          child: Center(
            child: Image.asset(
              'assets/images/left-arrow.png',
              width: Static.getwidth(context, 18),
              height: Static.getheight(context, 18),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
