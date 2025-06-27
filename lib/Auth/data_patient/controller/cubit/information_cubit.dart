import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());

  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String aged = "";
  String agem = "";
  String agey = "";
  String age = "";

  String hieght = "";
  String wieght = "";

  void setage({required String d ,required String m ,required String y  }){
    aged = d ;
    agem = m ;
    agey = y ;
    emit(InformationDate(date: "$aged-$agem-$agey"));
    age = "$aged-$agem-$agey";
  }

  bool checkdate(){
    if(aged.isNotEmpty&&agem.isNotEmpty&&agey.isNotEmpty){
      return false;
    }
    return true ;
  }

  void sethieght({required double h}){ 
    h = h/100 ;
    hieght = h.toString() ;
  }

  void setwieght({required int w}){
    wieght = w.toString() ;
  }

  void check({required AutovalidateMode aut}){
      autovalidateMode = aut ;
      emit(state);
  }
  
}
