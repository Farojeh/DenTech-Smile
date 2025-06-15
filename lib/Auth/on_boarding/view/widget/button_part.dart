import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Buttonpart extends StatelessWidget {
  const Buttonpart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height:(MediaQuery.of(context).size.height / 932) * 15,
        ),
        CustomButton(
          color: Static.basiccolor,
          redbl: 20,
          redbr: 20,
          redtl: 20,
          redtr: 20,
          height: 45,
          elevation: 7,
           width: MediaQuery.of(context).size.width * 0.45,
           onPressed: () => GoRouter.of(context).push(AppRouter.signUp),
          child: Text(
            "Patient",
            style: TextStyle(
                fontFamily: Static.afacadfont,
                fontWeight: FontWeight.w700,
                fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                color: Colors.white),
          ),
        ),
         SizedBox(
            height:(MediaQuery.of(context).size.height / 932) * 20,
        ),
        CustomButton(
            color: Colors.white,
            side: Static.basiccolor,
            redbl: 20,
            redbr: 20,
            redtl: 20,
            redtr: 20,
            elevation: 7,
            height: 45,
             width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              "Student",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w700,
                  fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                  color: Static.basiccolor),
            )),
         SizedBox(
            height:(MediaQuery.of(context).size.height / 932) * 20,
        ),
        CustomButton(
            color: Colors.white,
            side: Static.basiccolor,
            redbl: 20,
            redbr: 20,
            redtl: 20,
            redtr: 20,
            elevation: 7,
            height: 45,
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              "Professor",
              style: TextStyle(
                  fontFamily: Static.afacadfont,
                  fontWeight: FontWeight.w700,
                  fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                  color: Static.basiccolor),
            )),
      ],
    );
  }
}
