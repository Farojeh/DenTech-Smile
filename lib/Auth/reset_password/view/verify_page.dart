import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/verify_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/custom_verify_page.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyPage extends StatelessWidget {
  final bool fromregister ;
  const VerifyPage({super.key, required this.fromregister});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifyFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'Oops', state.errorMessage, ContentType.failure));
        } else if (state is VerifySuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'perfect', "verify Success", ContentType.success));
          GoRouter.of(context).push(AppRouter.resetpassword);
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomVerifyPage(fromregister:fromregister)),
      )),
    );
  }
}
