import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'verify_edit_state.dart';

class VerifyEditCubit extends Cubit<VerifyEditState> {
  VerifyEditCubit() : super(VerifyEditInitial());
  
    String otp = "";

  final apiService = getIt<ApiService>();

  void setverifyotp({required String n}) {
    otp = n;
  }

  Future<void> verifyEditNumber() async {
    emit(VerifyEditLoading());
      Map<String, String> login = { "otp": otp };
      Response response;
      try {
        response =
            await apiService.post(endPoint: "/verify-edit-Otp", data: login , token: true); 
        if (response.statusCode != 200 && response.statusCode != 201) {
          var failure =
              ServerFaliure.fromResponse(response.statusCode!, response.data);
          emit(VerifyEditFailure(errormessage: failure.errorMessage));
        } else {
          userInfo!.setString(Static.userNumber , userInfo!.getString(Static.userNumberedit)??"");
          emit(VerifyEditSuccess());
        }
      } catch (error) {
        if (error is DioException) {
          var failure = ServerFaliure.fromDioException(error);
          emit(VerifyEditFailure(errormessage: failure.errorMessage));
        }
      }
  }

  // Future<void> resendCode({
  //   required String phonenumber
  // }) async {
  //   emit(VerifyLoading());
  //  if (phonenumber.startsWith('0')) {
  //       phonenumber = phonenumber.substring(1);
  //     }
  //     Map<String, String> data = {
  //       "phone_number": phonenumber,
  //     };
  //     Response response;
  //     try {
  //       response =
  //           await apiService.post(endPoint: "/sendOtp", data: data); 
  //       if (response.statusCode != 200 && response.statusCode != 201) {
  //         var failure =
  //             ServerFaliure.fromResponse(response.statusCode!, response.data);
  //         emit(VerifyFailure(errorMessage: failure.errorMessage));
  //       } else {
  //         print(response.data);
  //         emit(ResendSuccess());
  //       }
  //     } catch (error) {
  //       if (error is DioException) {
  //         var failure = ServerFaliure.fromDioException(error);
  //         emit(VerifyFailure(errorMessage: failure.errorMessage));
  //       }
  //     }
  // }


}
