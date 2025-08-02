import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/my_resource_dialog_cubit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyResourceDialog extends StatelessWidget {
  final int id;
  const MyResourceDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyResourceDialogCubit, MyResourceDialogState>(
      listener: (context, state) {
        if (state is MyResourceDialogSuccess) {
          Navigator.of(context).pop("success");
        } else if (state is MyResourceDialogfailure) {
          Navigator.of(context).pop(state.errormessage);
        }
      },
      child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Are you sure you want to change status from reservation to not reservation",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          color: Colors.black,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Static.basiccolor,
                            height: 40,
                            width: 70,
                            redbl: 10,
                            redbr: 10,
                            redtl: 10,
                            redtr: 10,
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontFamily: Static.afacadfont,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomButton(
                            onPressed: () {
                              BlocProvider.of<MyResourceDialogCubit>(context)
                                  .changestatus(id);
                            },
                            color: Static.basiccolor,
                            height: 40,
                            width: 70,
                            redbl: 10,
                            redbr: 10,
                            redtl: 10,
                            redtr: 10,
                            child: BlocBuilder<MyResourceDialogCubit,
                                MyResourceDialogState>(
                              builder: (context, state) {
                                if (state is MyResourceDialogLoading) {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(
                                    "Change",
                                    style: TextStyle(
                                        fontFamily: Static.afacadfont,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  );
                                }
                              },
                            )),
                      ],
                    )
                  ]))),
    );
  }
}
