import 'package:dentech_smile/Auth/sign_up/view/widget/background_view.dart';
import 'package:dentech_smile/Auth/sign_up/view/widget/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundView(screen: SignUpbody(), goback: true),
    );
  }
}