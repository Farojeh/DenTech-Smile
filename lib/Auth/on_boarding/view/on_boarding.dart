import 'package:dentech_smile/Auth/on_boarding/controller/cubit/on_boarding_cubit.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          final cubit = context.read<OnBoardingCubit>();
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                controller: cubit.controller,
                itemCount: state.pageArray.length,
                itemBuilder: (context, index) => Container(
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
                          Positioned(
                            top: 600*100/MediaQuery.of(context).size.height,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                          )
                        ],
                      ),
                    )),
          );
        },
      ),
    );
  }
}
