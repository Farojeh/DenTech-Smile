import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/student/exchange/model/resource.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'exchange_dialog_state.dart';

class ExchangeDialogCubit extends Cubit<ExchangeDialogState> {
  ExchangeDialogCubit(int id, String imgpath, bool fromexchange)
      : super(ExchangeDialogInitial()) {
    initial(id, imgpath, fromexchange);
  }

  final apiService = getIt<ApiService>();

  void initial(int id, String imgpath, bool fromexchange) async {
    try {
      emit(ExchangeDialogLoading());
      Response response;
      response =
          await apiService.get(endPoint: "/resourceDetails/$id", token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(ExchangeDialogfailure(errormessage: failure.errorMessage));
        return;
      }
      Resource resource = Resource(
          name: response.data["resource_name"],
          id: id,
          image: imgpath,
          type: response.data["category"],
          startdate: response.data["loan_start_date"] ?? "none",
          enddate: response.data["loan_end_date"] ?? "none");
      String number;
      String name;
      if (fromexchange) {
        number = response.data["owner"]["phone"];
        name = response.data["owner"]["name"];
      } else {
        number = response.data["booked_by"]["phone"];
        name = response.data["booked_by"]["name"];
      }

      emit(ExchangeDialogSuccess(
          name: name, resource: resource, number: number));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(ExchangeDialogfailure(errormessage: failure.errorMessage));
      }
    }
  }
}
