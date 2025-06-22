import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/verify_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/design_verify.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/pin_widget.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/resend_password_button.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/top_verify_page.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVerifyPage extends StatefulWidget {
  final bool fromregister;
  const CustomVerifyPage({super.key, required this.fromregister});

  @override
  State<CustomVerifyPage> createState() => _CustomVerifyPageState();
}

class _CustomVerifyPageState extends State<CustomVerifyPage> {
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
        const DesignVerify(),
        const SizedBox(
          height: 30,
        ),
        Form(
            autovalidateMode: autovalidateMode,
            key: formkey,
            child: const PinWidget()),
        const ResendPasswordButton(),
        BlocBuilder<TranslationCubit, TranslationState>(
          builder: (context, trstate) {
            return CustomButton(
              color: Static.basiccolor,
              redbl: 20,
              redbr: 20,
              redtl: 20,
              redtr: 20,
              height: (MediaQuery.of(context).size.height / 932) * 58,
              width: MediaQuery.of(context).size.width * 0.44,
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    var cubit = BlocProvider.of<VerifyCubit>(context);
                    formkey.currentState!.save();
                    if (widget.fromregister) {
                      await cubit.verifyRegister(
                        name: userInfo!.getString(Static.userName)!,
                        number: userInfo!.getString(Static.userNumber)!,
                        password: userInfo!.getString(Static.userPassword)!,
                      );
                    } else {
                      await cubit.verify(
                          phonenumber: userInfo!.getString(Static.userNumber)!);
                    }
                  } catch (error) {
                    print(error);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(CustomSnackBar().customSnackBar(
                          'Oops', error.toString(), ContentType.failure));
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              child: BlocBuilder<VerifyCubit, VerifyState>(
                builder: (context, state) {
                  if (state is VerifyLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  } else {
                    return Text(
                      trstate.isEn ? "Verify" : "تأكيد",
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
