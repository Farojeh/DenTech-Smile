import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/design_verify.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/top_verify_page.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/controller/cubit/verify_edit_cubit.dart';
import 'package:dentech_smile/student/profile/view/widget/pinput_edit_widget.dart';
import 'package:dentech_smile/student/profile/view/widget/resend_password_button_edit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomVerifyEditPage extends StatefulWidget {
  const CustomVerifyEditPage({super.key});

  @override
  State<CustomVerifyEditPage> createState() => _CustomVerifyPageState();
}

class _CustomVerifyPageState extends State<CustomVerifyEditPage> {
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
            child: const PinEditWidget()),
        const ResendPasswordButtonEdit(),
        CustomButton(
          color: Static.basiccolor,
          redbl: 20,
          redbr: 20,
          redtl: 20,
          redtr: 20,
          height: (MediaQuery.of(context).size.height / 932) * 60,
          width: MediaQuery.of(context).size.width * 0.44,
          onPressed: () async {
            if (formkey.currentState!.validate()) {
              try {
                var cubit = BlocProvider.of<VerifyEditCubit>(context);
                formkey.currentState!.save();
                await cubit.verifyEditNumber();
              } catch (error) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(CustomSnackBar().customSnackBar(
                      'Oops', error.toString(), ContentType.failure));
              }
            } else {
              autovalidateMode = AutovalidateMode.always;
            }
          },
          child: BlocBuilder<VerifyEditCubit, VerifyEditState>(
            builder: (context, state) {
              if (state is VerifyEditLoading) {
                return const CircularProgressIndicator(
                  color: Colors.white,
                );
              } else {
                return Text(
                  "Verify",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w700,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                      color: Colors.white),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
