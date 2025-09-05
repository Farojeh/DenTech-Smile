import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
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
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(LoginFailure(errorMessage: failure.errorMessage));
        } else {
          await userInfo!
              .setString(Static.userName, response.data["user"]["name"]);
          await userInfo!.setString(
              Static.userNumber, response.data["user"]["phone_number"]);
          await userInfo!
              .setInt(Static.userRole, response.data["user"]["role_id"]);
          await userInfo!.setString(Static.token, response.data["token"]);
          if (response.data["user"]["role_id"] == 1) {
            await userInfo!.setString(
                Static.studentyear, response.data["user"]["student"]["year"]);
            await userInfo!.setString(Static.studentid,
                response.data["user"]["student"]["id"].toString());
          }
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
