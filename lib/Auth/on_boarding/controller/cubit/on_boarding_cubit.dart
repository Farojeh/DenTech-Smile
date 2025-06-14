import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState());
   
   PageController controller = PageController();

   void nextPage(int selectPage) {
    if (selectPage < 3) {
      int newPage = selectPage+1 ;
      controller.animateToPage(newPage,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
      emit(state.copyWith(selectPage: newPage));
    }
  }

}
