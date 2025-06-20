import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(NumberInitial());
  String number = "";
  Future<void> setnumber(
      {required String number,
      required BuildContext context}) async {
      
  }

  void setregisternumber({required String n}) {
    number = n;
  }
}
