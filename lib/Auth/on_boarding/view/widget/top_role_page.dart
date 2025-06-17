import 'package:dentech_smile/Auth/on_boarding/view/widget/buttom_curve.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/translate_widget.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class Toprolepage extends StatelessWidget {
  const Toprolepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:(MediaQuery.of(context).size.height / 932) * 510,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height:(MediaQuery.of(context).size.height / 932) * 510,
                width: double.infinity,
                color: Static.basiccolor,
              )),
          Positioned(
            top: 40,
            child: Image.asset(
              "assets/images/role_page2.png",
              height: (MediaQuery.of(context).size.height / 932) * 401,
              width: (MediaQuery.of(context).size.width / 430) * 370,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Positioned(top: 30, right: 10, child: TranslateWidget())
        ],
      ),
    );
  }
}
