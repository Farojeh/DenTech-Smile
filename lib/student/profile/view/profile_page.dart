import 'package:dentech_smile/student/profile/view/widget/profile_background.dart';
import 'package:dentech_smile/student/profile/view/widget/profile_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Profilebackground(screen: ProfileBody());
  }
}
