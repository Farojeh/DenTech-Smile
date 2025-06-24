import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());

  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String age = "";
  String hieght = "";
  String wieght = "";

  void setage({required String a}){
    age = a ;
  }

  void sethieght({required String h}){
    hieght = h ;
  }

  void setwieght({required String w}){
    wieght = w ;
  }

  void check({required AutovalidateMode aut}){
      autovalidateMode = aut ;
      emit(state);
  }
  
}
