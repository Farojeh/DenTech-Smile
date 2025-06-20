import 'package:bloc/bloc.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/illness_page.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/information_page.dart';
import 'package:dentech_smile/Auth/data_patient/view/widget/medican_page.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'data_patient_state.dart';

class DataPatientCubit extends Cubit<DataPatientState> {
  DataPatientCubit() : super(DataPatientState());

    PageController controller = PageController();

    void nextPage() {
    if (state.selectPage < 2) {
      int newPage = state.selectPage+1 ;
      controller.animateToPage(newPage,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
      emit(state.copyWith(selectPage: newPage));
    }
  }

  void previousPage() {
    if (state.selectPage > 0) {
      int newPage = state.selectPage-1 ;
      controller.animateToPage(newPage,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
      emit(state.copyWith(selectPage: newPage));
    }
  }


}
