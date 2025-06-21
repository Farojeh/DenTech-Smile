import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String password = "";
  String number = "";

  final apiService = getIt<ApiService>();

  Future<void> login({required bool patient}) async {
    emit(LoginLoading());
    if (password.isNotEmpty && number.isNotEmpty) {
      Map<String, String> login;
      if (patient) {
        if (number.startsWith('0')) {
          number = number.substring(1);
        }
        login = {"phone_number": number, "password": password};
      } else {
        login = {"national_number": number, "password": password};
      }
      Response response;
      try {
        response = await apiService.post(endPoint: "/login", data: login);
        print(response.data);
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(LoginFailure(errorMessage: failure.errorMessage));
        } else {
          emit(LoginSuccess());
        }
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(LoginFailure(errorMessage: failure.errorMessage));
        }
      }
    } else {
      emit(LoginFailure(errorMessage: "SomeThing error, please try again"));
    }
  }

  void setregisternumber({required String n}) {
    number = n;
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
