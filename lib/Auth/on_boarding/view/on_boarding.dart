import 'package:dentech_smile/Auth/on_boarding/view/widget/on_boarding_body.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/on_boarding_button.dart';
import 'package:flutter/material.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Stack(
        children: [Onboardingbody(), Onboardingbutton()],
      ),
    ));
  }
}
