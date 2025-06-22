import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'number_state.dart';

class NumberCubit extends Cubit<NumberState> {
  NumberCubit() : super(NumberInitial());

  String number = "";

  final apiService = getIt<ApiService>();

  Future<void> setnumber() async {
    emit(NumberLoading());
    if (number.startsWith('0')) {
      number = number.substring(1);
    }
    Map<String, String> data = {
      "phone_number": number,
    };
    Response response;
    try {
      response = await apiService.post(endPoint: "/sendOtp", data: data);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(NumberFailure(errorMessage: failure.errorMessage));
      } else {
        print(response.data);
        userInfo!.setString(Static.userNumber, number);
        emit(NumberSuccess());
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(NumberFailure(errorMessage: failure.errorMessage));
      }
    }
  }

  void setregisternumber({required String n}) {
    number = n;
  }
}
