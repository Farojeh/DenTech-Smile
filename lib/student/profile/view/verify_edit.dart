import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/student/profile/controller/cubit/verify_edit_cubit.dart';
import 'package:dentech_smile/student/profile/view/widget/custom_verify_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyPageEdit extends StatelessWidget {
  const VerifyPageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEditCubit, VerifyEditState>(
      listener: (context, state) {
        if (state is VerifyEditFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'Oops', state.errormessage, ContentType.failure));
        } else if (state is VerifyEditSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'perfect', "verify Success", ContentType.success));
          Future.delayed(const Duration(milliseconds: 500), () {
            GoRouter.of(context).pop();
          });
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const CustomVerifyEditPage()),
      )),
    );
  }
}
