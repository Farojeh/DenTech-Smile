import 'package:dentech_smile/Auth/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignupFields extends StatefulWidget {
  const CustomSignupFields({super.key});

  @override
  State<CustomSignupFields> createState() => _CustomSignupFieldsState();
}

class _CustomSignupFieldsState extends State<CustomSignupFields> {
  
  String? name ;
  
  String? number;

  String? password;

  String? confirmpass;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return Directionality(
          textDirection: state.isEn?TextDirection.ltr:TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 30,
              ),
              CustomTextField(
                isEnglish: state.isEn,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.person_pin,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                isname: true,
                height: (MediaQuery.of(context).size.height / 932) * 80,
                onsaved: (data) {
                  name = data;
                  BlocProvider.of<SignUpCubit>(context).setregistername(n: name!);
                },
                hint:state.isEn? "      Enter your name       ":"     ادخل اسمك بالكامل      ",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 5,
              ),
              CustomTextField(
                isEnglish: state.isEn,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.phone_in_talk,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
                isnumber: true,
                height: (MediaQuery.of(context).size.height / 932) * 80,
                onsaved: (data) {
                  number = data;
                  BlocProvider.of<SignUpCubit>(context).setregisternumber(n: number!);
                },
                hint:state.isEn? "      Enter mobile number       ": "     ادخل رقم الموبايل      ",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 5,
              ),
              CustomTextField(
                 isEnglish: state.isEn,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.password_sharp,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
                height: (MediaQuery.of(context).size.height / 932) * 80,
                ispass: true,
                onsaved: (data) {
                  password = data;
                  BlocProvider.of<SignUpCubit>(context)
                      .setregisterpassword(p: password!);
                },
                obscureText: true,
                hint:state.isEn? "      Enter password       ": "     ادخل كلمة المرور      ",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 932) * 5,
              ),
              CustomTextField(
                isEnglish: state.isEn,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.password_sharp,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                height: (MediaQuery.of(context).size.height / 932) * 80,
                onsaved: (data) {
                  confirmpass = data;
                  if (confirmpass != password) {
                    throw "";
                  }
                },
                obscureText: true,
                hint:state.isEn? "      Enter confirm password       ": "     تأكيد كلمة المرور      ",
                backgroundcolor: const Color(0xffF5F5F5),
                hintcolor: Static.lightcolor,
                hintsize: (MediaQuery.of(context).size.width / 430) * 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
