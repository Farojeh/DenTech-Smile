import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/custom_snackbar.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/profile/controller/cubit/number_edit_dialog_cubit.dart';
import 'package:dentech_smile/student/profile/view/widget/custom_number_field_edit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NumberEditDialg extends StatefulWidget {
  final bool editnumber;
  const NumberEditDialg({super.key, required this.editnumber});

  @override
  State<NumberEditDialg> createState() => _NumberDialgState();
}

class _NumberDialgState extends State<NumberEditDialg> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NumberEditDialogCubit, NumberEditDialogState>(
      listener: (context, state) {
        if (state is NumberEditDialogfailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'Oops', state.errormessage, ContentType.failure));
        } else if (state is NumberEditDialogSuccess) {
          if (widget.editnumber) {
            GoRouter.of(context).push(AppRouter.verifyEditPage);
          } else {
            GoRouter.of(context).push(AppRouter.resetpassword , extra: true);
          }
          Navigator.of(context).pop();
          print(
              "******************************** Number Success ********************************");
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.26,
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your number",
                  style: TextStyle(
                      fontFamily: Static.afacadfont,
                      fontWeight: FontWeight.w700,
                      fontSize: (MediaQuery.of(context).size.width / 430) * 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    autovalidateMode: autovalidateMode,
                    key: formkey,
                    child: const CustomNumberFieldEdit()),
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
                    height: (MediaQuery.of(context).size.height / 932) * 48,
                    width: MediaQuery.of(context).size.width * 0.35,
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        var cubit =
                            BlocProvider.of<NumberEditDialogCubit>(context);
                        formkey.currentState!.save();
                        if (widget.editnumber) {
                          await cubit.editnumber();
                        } else {
                          cubit.checknumber();
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    child: BlocBuilder<NumberEditDialogCubit,
                        NumberEditDialogState>(
                      builder: (context, numstate) {
                        if (numstate is NumberEditDialogLoading) {
                          return const CircularProgressIndicator(
                            color: Colors.white,
                          );
                        } else {
                          return Text(
                            "Save",
                            style: TextStyle(
                                fontFamily: Static.afacadfont,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    (MediaQuery.of(context).size.width / 430) *
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
    );
  }
}
