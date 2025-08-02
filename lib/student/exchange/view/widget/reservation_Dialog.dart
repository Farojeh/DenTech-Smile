import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/exchange/controller/cubit/reservation_cubit.dart';
import 'package:dentech_smile/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReservationDialog extends StatelessWidget {
  final int resourceid;
  const ReservationDialog({super.key, required this.resourceid});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.myexchange);
        } else if (state is Reservationfailure) {
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
                      "Are you sure you want to reservation this Resource?",
                      style: TextStyle(
                          fontFamily: Static.arialRoundedMTfont,
                          color: Colors.black,
                          fontSize: 17),
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
                              BlocProvider.of<ReservationCubit>(context)
                                  .save(resourceid);
                            },
                            color: Static.basiccolor,
                            height: 40,
                            width: 70,
                            redbl: 10,
                            redbr: 10,
                            redtl: 10,
                            redtr: 10,
                            child:
                                BlocBuilder<ReservationCubit, ReservationState>(
                              builder: (context, state) {
                                if (state is ReservationLoading) {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                } else {
                                  return Text(
                                    "Save",
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
