import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit(String des) : super(DescriptionInitial(des: des));

  void setdesc({required String n}) {
    emit(DescriptionInitial(des: n));
  }

  final apiService = getIt<ApiService>();

  void savedesc(String id) async {
    String des = "";
    if (state is DescriptionInitial) {
     des = (state as DescriptionInitial).des;
    }
    try {
      emit(DescriptionLoading());
      Map<String, String> data = {"appointment_id": id, "description": des};
      final response = await apiService.post(
          endPoint: "/add-description", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(Descriptionfailure(errormessage: failure.errorMessage));
        return;
      }
      emit(Descriptionsuccess(des: des));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(Descriptionfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
