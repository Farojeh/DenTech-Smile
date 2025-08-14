import 'package:dentech_smile/student/profile/controller/cubit/profile_image_cubit.dart';
import 'package:dentech_smile/student/profile/view/widget/profile_background.dart';
import 'package:dentech_smile/student/profile/view/widget/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProfileImageCubit())],
      child: const Profilebackground(screen: ProfileBody()),
    );
  }
}
