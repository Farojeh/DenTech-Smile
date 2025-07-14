import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/description_cubit.dart';
import 'package:dentech_smile/student/Home/view/widget/custom_desc_field.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriotionDialog extends StatefulWidget {
  final String init ;
  const DescriotionDialog({super.key, required this.init});

  @override
  State<DescriotionDialog> createState() => _DescriotionDialogState();
}

class _DescriotionDialogState extends State<DescriotionDialog> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  child: CustomDescField(init: widget.init,)),
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
                        var cubit = BlocProvider.of<DescriptionCubit>(context);
                        formkey.currentState!.save();
                        cubit.savedesc();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontFamily: Static.afacadfont,
                          fontWeight: FontWeight.w700,
                          fontSize:
                              (MediaQuery.of(context).size.width / 430) * 17,
                          color: Colors.white),
                    )),
              ),
            ],
          )),
    );
  }
}
