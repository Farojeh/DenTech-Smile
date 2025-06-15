import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
   String password = "";
   String number = "";
   String name = "";

  Future<void> register(
      {required String name ,
      required String number,
      required String password,
      required BuildContext context}) async {
        emit(SignUpLoading());
        Future.delayed(const Duration(seconds: 3),(){
        if(name.isNotEmpty && password.isNotEmpty && number.isNotEmpty ){
        //    mainuser = UserModel(email: email, password: password);
        // userInfo!.setBool("user", true);
        // userInfo!.setString("email", email);
        // userInfo!.setString("password", password);
          emit(SignUpSuccess());
        }else{
          emit(SignUpFailure(errorMessage: "SomeThing error, please try again"));
        }
        });
  }

  void setregistername({required String n}) {
    name = n;
  }
  
  void setregisternumber({required String n}) {
    number = n;
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
