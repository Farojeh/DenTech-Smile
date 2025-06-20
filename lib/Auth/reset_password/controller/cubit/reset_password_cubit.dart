import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  String password = "";

  Future<void> register(
      {required String password,
      required BuildContext context}) async {
        emit(ResetPasswordLoading());
        Future.delayed(const Duration(seconds: 3),(){
        if( password.isNotEmpty ){
        //    mainuser = UserModel(email: email, password: password);
        // userInfo!.setBool("user", true);
        // userInfo!.setString("email", email);
        // userInfo!.setString("password", password);
          emit(ResetPasswordSuccess());
        }else{
          emit(ResetPasswordFailure(errorMessage: "SomeThing error, please try again"));
        }
        });
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
  
}
