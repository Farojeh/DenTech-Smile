import 'package:dentech_smile/Auth/on_boarding/view/widget/translate_widget.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopVerifyPage extends StatelessWidget {
  const TopVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => GoRouter.of(context).pop(),
          overlayColor: MaterialStatePropertyAll(Colors.white.withOpacity(0)),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            height: (MediaQuery.of(context).size.height / 932) * 55,
            width: (MediaQuery.of(context).size.height / 932) * 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xffD1E3E5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Static.basiccolor,
            ),
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 5),
          child: TranslateWidget(),
        )
      ],
    );
  }
}
