import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  String password = "";
  String number = "";
  String name = "";

  final apiService = getIt<ApiService>();

  Future<void> register() async {
    emit(SignUpLoading());
    if (password.isNotEmpty && number.isNotEmpty) {
      if (number.startsWith('0')) {
        number = number.substring(1);
      }
      Map<String, String> login = {
        "role_id": "2",
        "name": name,
        "phone_number": number,
        "password": password,
        "password_confirmation": password
      };
      Response response;
       print(login);
      try {
        response = await apiService.post(endPoint: "/addUser", data: login);
        print(response.data);
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(SignUpFailure(errorMessage: failure.errorMessage));
        } else {
          userInfo!.setString(Static.userName,name);
          userInfo!.setString(Static.userNumber,number);
          userInfo!.setString(Static.userPassword,password);
          emit(SignUpSuccess());
        }
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(SignUpFailure(errorMessage: failure.errorMessage));
        }
      }
    } else {
      emit(SignUpFailure(errorMessage: "SomeThing error, please try again"));
    }
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
