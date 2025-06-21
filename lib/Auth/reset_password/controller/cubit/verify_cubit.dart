import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
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
        print(login);
        response =
            await apiService.post(endPoint: "/patientVerifyOtp", data: login); 
        print(response.data);
        if (response.statusCode != 200 && response.statusCode != 201) {
           print("hhhhhhhhhhhhhhhhhhhhh");
           print(response.data);
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(VerifyFailure(errorMessage: failure.errorMessage));
        } else {
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

  Future<void> verify() async {
    print("************************ otp is $otp **********************");
    emit(VerifyLoading());
    Future.delayed(const Duration(seconds: 3), () {
      // if (mainotp == otp) {
      //   emit(VerifySuccess());
      // } else {
      //   emit(VerifyFailure(errorMessage: "otp is not true"));
      // }
    });
  }
}
