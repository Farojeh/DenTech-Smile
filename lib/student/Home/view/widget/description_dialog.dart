import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/description_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_desc_field.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriotionDialog extends StatefulWidget {
  final String init;
  final String appointmentid;
  const DescriotionDialog(
      {super.key, required this.init, required this.appointmentid});

  @override
  State<DescriotionDialog> createState() => _DescriotionDialogState();
}

class _DescriotionDialogState extends State<DescriotionDialog> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DescriptionCubit, DescriptionState>(
      listener: (context, state) {
        if (state is Descriptionfailure) {
          Static.failure(context, state.errormessage);
          Navigator.of(context).pop();
        } else if (state is Descriptionsuccess) {
          Navigator.of(context).pop(state.des);
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter more description",
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
                    child: CustomDescField(
                      init: widget.init,
                    )),
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
                              BlocProvider.of<DescriptionCubit>(context);
                          formkey.currentState!.save();
                          cubit.savedesc(widget.appointmentid);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                      child: BlocBuilder<DescriptionCubit, DescriptionState>(
                        builder: (context, state) {
                          if (state is DescriptionLoading) {
                            return const CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
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
                        },
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
