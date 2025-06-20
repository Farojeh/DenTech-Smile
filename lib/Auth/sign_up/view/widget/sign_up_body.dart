import 'package:dentech_smile/Auth/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:dentech_smile/Auth/sign_up/view/widget/custom_signup_fields.dart';
import 'package:dentech_smile/Auth/sign_up/view/widget/login_button.dart';
import 'package:dentech_smile/Auth/sign_up/view/widget/top_sign_up.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SignUpbody extends StatefulWidget {
  const SignUpbody({super.key});

  @override
  State<SignUpbody> createState() => _SignUpbodyState();
}

class _SignUpbodyState extends State<SignUpbody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'Oops', state.errorMessage, ContentType.failure));
        } else if (state is SignUpSuccess) {
          // GoRouter.of(context).go(AppRouter.homeView);
          print(
              "******************************** SignUpSuccess ********************************");
        }
      },
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopSignPage(),
              Form(
                  autovalidateMode: autovalidateMode,
                  key: formkey,
                  child: const CustomSignupFields()),
              const LoginButton(),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 30,
              ),
              CustomButton(
                color: Static.basiccolor,
                redbl: 20,
                redbr: 20,
                redtl: 20,
                redtr: 20,
                height: (MediaQuery.of(context).size.height / 932) * 58,
                width: MediaQuery.of(context).size.width * 0.47,
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      var cubit = BlocProvider.of<SignUpCubit>(context);
                      formkey.currentState!.save();
                      await cubit.register(
                          context: context,
                          name: cubit.name,
                          number: cubit.number,
                          password: cubit.password);
                    } catch (error) {
                      print(error);
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
                  "انشاء حساب",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w400,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 23,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
