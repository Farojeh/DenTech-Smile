import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'dart:convert';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeInitial()) {
    initialpage();
  }

  final apiService = getIt<ApiService>();

  void initialpage() async {
    try {
      emit(QrCodeLoading());
      Response response;
      response = await apiService.get(endPoint: "/QR_code", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(QrCodefailure(errormessage: failure.errorMessage));
        return;
      }
      int studentid = response.data["student_id"];
      int sessionid = response.data["session_id"];
      Map<String, String> data = {
        "student_id": studentid.toString(),
        "session_id": sessionid.toString()
      };
      String jsonString = jsonEncode(data);
      emit(QrCodeSuccess(qrCode: jsonString));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(QrCodefailure(errormessage: failure.errorMessage));
      }
    }
  }
}
