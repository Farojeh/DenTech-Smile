import 'package:dentech_smile/Auth/log_in/view/widget/background_login.dart';
import 'package:dentech_smile/Auth/log_in/view/widget/login_body.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  final bool patient;
  const LogInView({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundLogin(screen: LogInBody(patient: patient,), goback: true),
    );
  }
}