import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'number_edit_dialog_state.dart';

class NumberEditDialogCubit extends Cubit<NumberEditDialogState> {
  NumberEditDialogCubit() : super(NumberEditDialogInitial());

  String number = "";

  final apiService = getIt<ApiService>();

  Future<void> editnumber() async {
    emit(NumberEditDialogLoading());
    if (number.startsWith('0')) {
      number = number.substring(1);
    }
    Map<String, String> data = {"phone_number": number, "language": "en"};
    Response response;
    try {
      response = await apiService.post(
          endPoint: "/edit-user-profile", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(NumberEditDialogfailure(errormessage: failure.errorMessage));
      } else {
        print(response.data);
        userInfo!.setString(Static.userNumberedit, number);
        emit(NumberEditDialogSuccess());
      }
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(NumberEditDialogfailure(errormessage: failure.errorMessage));
      }
    }
  }

  void setnumber({required String n}) {
    number = n;
  }

  void checknumber() {
    String userNumber = userInfo!.getString(Static.userNumber) ?? "";
    if (number.startsWith('0')) {
      number = number.substring(1);
    }
    if (number == userNumber) {
      emit(NumberEditDialogSuccess());
    } else {
      emit(NumberEditDialogfailure(errormessage: "Number is not true"));
    }
  }
}
