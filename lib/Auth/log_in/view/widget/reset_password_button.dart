import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin:const EdgeInsets.only(right: 30),
     alignment: Alignment.centerRight,
      child: Text(
             "Forget Password ?",
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1,
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
            ),
    );
  }
}