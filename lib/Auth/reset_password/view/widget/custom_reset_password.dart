import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/reset_password_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/design_reset_password.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/reset_password_fields.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/top_verify_page.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResetPassword extends StatefulWidget {
  const CustomResetPassword({super.key});

  @override
  State<CustomResetPassword> createState() => _CustomResetPasswordState();
}

class _CustomResetPasswordState extends State<CustomResetPassword> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const TopVerifyPage(),
        const DesignResetPassword(),
        const SizedBox(
          height: 30,
        ),
        Form(
            autovalidateMode: autovalidateMode,
            key: formkey,
            child: const ResetPasswordFields()),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<TranslationCubit, TranslationState>(
          builder: (context, trstate) {
            return CustomButton(
              color:const Color(0xff3EAEB6),
              redbl: 20,
              redbr: 20,
              redtl: 20,
              redtr: 20,
              height: (MediaQuery.of(context).size.height / 932) * 58,
              width: MediaQuery.of(context).size.width * 0.5,
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    var cubit = BlocProvider.of<ResetPasswordCubit>(context);
                    formkey.currentState!.save();
                    await cubit.register(
                        password: cubit.password, context: context);
                  } catch (error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(CustomSnackBar().customSnackBar(
                          'Oops', error.toString(), ContentType.failure));
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                builder: (context, state) {
                  if (state is ResetPasswordLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else {
                    return Text(
                      trstate.isEn ? "Reset Password" : "تأكيد كلمة المرور",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              (MediaQuery.of(context).size.width / 430) * 23,
                          color: Colors.white),
                    );
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
