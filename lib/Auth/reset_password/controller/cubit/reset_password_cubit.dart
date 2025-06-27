import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  String password = "";

  final apiService = getIt<ApiService>();

  Future<void> resertpassword({required String number}) async {
    emit(ResetPasswordLoading());
    if (number.startsWith('0')) {
      number = number.substring(1);
    }
    Map<String, String> login = {
      "phone_number": number,
      "password": password,
      "password_confirmation": password
    };
    Response response;
    try {
      response = await apiService.post(endPoint: "/resetPassword", data: login);
      print(response.data);
      if (response.statusCode != 200 && response.statusCode != 201) {
        print(response.data);
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(ResetPasswordFailure(errorMessage: failure.errorMessage));
      } else {
        emit(ResetPasswordSuccess());
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(ResetPasswordFailure(errorMessage: failure.errorMessage));
      }
    }
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
