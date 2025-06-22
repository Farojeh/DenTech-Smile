import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/Auth/reset_password/controller/cubit/number_cubit.dart';
import 'package:dentech_smile/Auth/reset_password/view/widget/custom_number_fields.dart';
import 'package:dentech_smile/Auth/translation/cubit/translation_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NumberDialg extends StatefulWidget {
  const NumberDialg({super.key});

  @override
  State<NumberDialg> createState() => _NumberDialgState();
}

class _NumberDialgState extends State<NumberDialg> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        return BlocListener<NumberCubit, NumberState>(
          listener: (context, state) {
            if (state is NumberFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(CustomSnackBar().customSnackBar(
                    'Oops', state.errorMessage, ContentType.failure));
            } else if (state is NumberSuccess) {
              GoRouter.of(context).push(AppRouter.verifyPage, extra: false);
              print(
                  "******************************** Number Success ********************************");
            }
          },
          child: Directionality(
            textDirection: state.isEn ? TextDirection.ltr : TextDirection.rtl,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.isEn
                            ? "Please enter your number"
                            : "من فضلك ادخل رقم الموبايل ",
                        style: TextStyle(
                            fontFamily: Static.afacadfont,
                            fontWeight: FontWeight.w700,
                            fontSize:
                                (MediaQuery.of(context).size.width / 430) * 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                          autovalidateMode: autovalidateMode,
                          key: formkey,
                          child: const CustomNumberField()),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: CustomButton(
                          color: Static.basiccolor,
                          redbl: 15,
                          redbr: 15,
                          redtl: 15,
                          redtr: 15,
                          height:
                              (MediaQuery.of(context).size.height / 932) * 48,
                          width: MediaQuery.of(context).size.width * 0.35,
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              var cubit = BlocProvider.of<NumberCubit>(context);
                              formkey.currentState!.save();
                              await cubit.setnumber();
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                            }
                          },
                          child: BlocBuilder<NumberCubit, NumberState>(
                            builder: (context, numstate) {
                              if (numstate is NumberLoading) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              } else {
                                return Text(
                                  state.isEn ? "Save" : " حفظ الرقم",
                                  style: TextStyle(
                                      fontFamily: Static.afacadfont,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          (MediaQuery.of(context).size.width /
                                                  430) *
                                              17,
                                      color: Colors.white),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
