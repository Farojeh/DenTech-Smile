import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/log_in/controller/cubit/login_cubit.dart';
import 'package:dentech_smile/Auth/log_in/view/widget/custom_login_fields.dart';
import 'package:dentech_smile/Auth/log_in/view/widget/reset_password_button.dart';
import 'package:dentech_smile/Auth/log_in/view/widget/top_login_page.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, trstate) {
        return BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(CustomSnackBar().customSnackBar(
                    'Oops', state.errorMessage, ContentType.failure));
            } else if (state is LoginSuccess) {
              // GoRouter.of(context).go(AppRouter.homeView);
              print(
                  "******************************** SignUpSuccess ********************************");
            }
          },
          child: Directionality(
              textDirection:trstate.isEn? TextDirection.ltr:TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TopLoginPage(),
                  Form(
                      autovalidateMode: autovalidateMode,
                      key: formkey,
                      child: const CustomLoginFields()),
                  const ResetPasswordButton(),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height / 932) * 35,
                  ),
                  CustomButton(
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
                          var cubit = BlocProvider.of<LoginCubit>(context);
                          formkey.currentState!.save();
                          await cubit.register(
                              context: context,
                              number: cubit.number,
                              password: cubit.password);
                        } catch (error) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(CustomSnackBar().customSnackBar(
                                'Oops',
                                'password is\'t equal confirm password',
                                ContentType.failure));
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    child: Text(
                      trstate.isEn? "Login":"تسجيل الدخول",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              (MediaQuery.of(context).size.width / 430) * 23,
                          color: Colors.white),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
