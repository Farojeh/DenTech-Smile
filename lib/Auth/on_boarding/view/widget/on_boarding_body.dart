import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/Auth/on_boarding/view/widget/on_boarding_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboardingbody extends StatelessWidget {
  const Onboardingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        return PageView.builder(
            controller: cubit.controller,
            itemCount: state.pageArray.length,
            itemBuilder: (context, index) => SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        state.pageArray[index]["image"],
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF737373).withOpacity(0.15),
                                const Color(0xFFFFFDFD).withOpacity(0.05),
                              ],
                            ),
                          )),
                      Onboardingtitle(index: index,),
                    ],
                  ),
                ));
      },
    );
  }
}
