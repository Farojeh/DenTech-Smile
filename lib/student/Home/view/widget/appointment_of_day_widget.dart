import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/student/Home/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentOfDayWidget extends StatelessWidget {
  const AppointmentOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        if (state is HomeInitial) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cubit.days[state.select].appointments
                  .map((e) => Container(
                        height: Static.gethieght(context, 90),
                        width: Static.getwieght(context, 362),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: Colors.black.withOpacity(0.25)),
                            borderRadius: BorderRadius.circular(10)),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: Static.gethieght(context, 70),
                            width: Static.getwieght(context, 80),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6,
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "# ${e.tag}",
                              style: TextStyle(
                                  fontFamily: Static.afacadfont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Static.getwieght(context, 35),
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 13, bottom: 2, top: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.patient,
                                  style: TextStyle(
                                      fontFamily: Static.arialRoundedMTfont,
                                      fontSize: Static.getwieght(context, 18),
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 2.5,
                                ),
                                Text(
                                  "${e.start}  →  ${e.end}",
                                  style: TextStyle(
                                      fontFamily: Static.afacadfont,
                                      fontWeight: FontWeight.w400,
                                      color: Static.lightcolor,
                                      fontSize: Static.getwieght(context, 15)),
                                ),
                                const SizedBox(
                                  height: 2.5,
                                ),
                                Text(
                                  e.internship,
                                  style: TextStyle(
                                      fontFamily: Static.afacadfont,
                                      fontWeight: FontWeight.w400,
                                      color: Static.lightcolor,
                                      fontSize: Static.getwieght(context, 15)),
                                )
                              ],
                            ),
                          )
                        ]),
                      ))
                  .toList(),
            ),
          );
        } else {
          return const Text("somthing wrong");
        }
      },
    );
  }
}
