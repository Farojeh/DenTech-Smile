import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  final apiService = getIt<ApiService>();
  void save(int resourceid) async {
    try {
      emit(ReservationLoading());
      Map<String, String> data = {
        "resource_id": resourceid.toString(),
        "student_id": userInfo!.getString(Static.studentid)!
      };
      Response response;
      response = await apiService.post(
          endPoint: "/bookResource", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Reservationfailure(errormessage: failure.errorMessage));
        return;
      }
      emit(ReservationSuccess());
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Reservationfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
