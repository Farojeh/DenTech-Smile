import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  String otp = "";

  final apiService = getIt<ApiService>();

  void setverifyotp({required String n}) {
    otp = n;
  }

  Future<void> verifyRegister({
    required String name,
    required String number,
    required String password,
  }) async {
    emit(VerifyLoading());
    if (number.startsWith('0')) {
        number = number.substring(1);
      }
      Map<String, String> login = {
        "name": name,
        "phone_number": number,
        "password": password,
        "otp": otp
      };
      Response response;
      try {
        response =
            await apiService.post(endPoint: "/patientVerifyOtp", data: login); 
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        } else {
          userInfo!.clear();
          userInfo!.setString(Static.userName , response.data["patient"]["name"]);
          userInfo!.setString(Static.userNumber , response.data["patient"]["phone_number"]);
          userInfo!.setInt(Static.userRole , response.data["patient"]["role_id"]);
          userInfo!.setString(Static.token , response.data["token"]);
           print(response.data);
          emit(VerifySuccess());
        }
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        }
      }
  }

  Future<void> verify({
    required String phonenumber
  }) async {
    emit(VerifyLoading());
   if (phonenumber.startsWith('0')) {
        phonenumber = phonenumber.substring(1);
      }
      Map<String, String> data = {
        "phone_number": phonenumber,
        "otp": otp
      };
      Response response;
      try {
        print(data);
        response =
            await apiService.post(endPoint: "/verifyOtp", data: data); 
        print(response.data);
        if (response.statusCode != 200 && response.statusCode != 201) {
           print("hhhhhhhhhhhhhhhhhhhhh");
           print(response.data);
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        } else {
           print(response.data);
          emit(VerifySuccess());
        }
      } catch (error) {
        if (error is DioException) {
          print("jjjjjjjjjjjjjjjjjjjjj");
          var failure = ServerFaliure.fromDioException(error);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        }
      }
  }

  Future<void> resendCode({
    required String phonenumber
  }) async {
    emit(VerifyLoading());
   if (phonenumber.startsWith('0')) {
        phonenumber = phonenumber.substring(1);
      }
      Map<String, String> data = {
        "phone_number": phonenumber,
      };
      Response response;
      try {
        response =
            await apiService.post(endPoint: "/sendOtp", data: data); 
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        } else {
          print(response.data);
          emit(ResendSuccess());
        }
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        }
      }
  }


}
