import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String password = "";
   String number = "";

  Future<void> register(
      {required String number,
      required String password,
      required BuildContext context}) async {
        emit(LoginLoading());
        Future.delayed(const Duration(seconds: 3),(){
        if( password.isNotEmpty && number.isNotEmpty ){
        //    mainuser = UserModel(email: email, password: password);
        // userInfo!.setBool("user", true);
        // userInfo!.setString("email", email);
        // userInfo!.setString("password", password);
          emit(LoginSuccess());
        }else{
          emit(LoginFailure(errorMessage: "SomeThing error, please try again"));
        }
        });
  }

  void setregisternumber({required String n}) {
    number = n;
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
