import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Onboardingbutton extends StatelessWidget {
  const Onboardingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        return Positioned(
          bottom: MediaQuery.of(context).size.height *
              0.07,
          right: 30,
          child: InkWell(
            onTap: () {
              if (state.selectPage >= 3) {
                GoRouter.of(context).pushReplacement(AppRouter.roleSelectionPage);
              } else {
                cubit.nextPage(state.selectPage);
              }
            },
            child: Container(
              padding:const EdgeInsets.all(14),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color:const Color(0xffF2F2F2).withOpacity(0.7),
                shape: BoxShape.circle, 
                border: Border.all(
                  color: Colors.black, 
                  width: 0.7, 
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), 
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset:const Offset(0, 3), 
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/Vector.png",
              ),
            ),
          ),
        );
      },
    );
  }
}
