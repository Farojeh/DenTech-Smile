import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboardingtitle extends StatelessWidget {
  final int index ;
  const Onboardingtitle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Positioned(
          top: 600 * 100 / MediaQuery.of(context).size.height,
          right: 20,
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.77,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.pageArray[index]["title"],
                  style: TextStyle(
                    fontFamily: Static.abhayaLibrefont,
                    fontSize: 29,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    state.pageArray[index]["subtitle"],
                    style: TextStyle(
                        fontFamily: Static.afacadfont,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xff151515)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
