import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'my_resource_dialog_state.dart';

class MyResourceDialogCubit extends Cubit<MyResourceDialogState> {
  MyResourceDialogCubit() : super(MyResourceDialogInitial());

  final apiService = getIt<ApiService>();

  void changestatus(int id) async {
    try {
      emit(MyResourceDialogLoading());
      Map<String, String> data = {
        "resource_id": id.toString(),
      };
      Response response;
      response = await apiService.post(
          endPoint: "/releaseResource", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(MyResourceDialogfailure(errormessage: failure.errorMessage));
        return;
      }
      emit(MyResourceDialogSuccess());
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(MyResourceDialogfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
