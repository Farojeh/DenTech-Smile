import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool isArabic = true;
  void changeLang() {
    isArabic = !isArabic;
    emit(ThemeSuccess());
  }
}
