import 'package:dentech_smile/Auth/log_in/view/widget/background_login.dart';
import 'package:dentech_smile/Auth/log_in/view/widget/login_body.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundLogin(screen: LogInBody(), goback: true),
    );
  }
}