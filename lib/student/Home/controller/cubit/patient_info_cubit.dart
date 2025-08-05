import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'patient_info_state.dart';

class PatientInfoCubit extends Cubit<PatientInfoState> {
  PatientInfoCubit(int id) : super(PatientInfoInitial()) {
    initial(id);
  }

  final apiService = getIt<ApiService>();

  Future<void> initial(int id) async {
    try {
      emit(PatientInfoLoading());
      Map<String, String> data = {"patient_id": id.toString()};
      final response = await apiService.post(
          endPoint: "/patient-info", data: data, token: true);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(PatientInfofailure(errormessage: failure.errorMessage));
        return;
      }
      String age = response.data["birthdate"];
      String height = response.data["height"].toString();
      String wieght = response.data["weight"].toString();
      List<int> diseasesjson = (response.data["diseases"] as List<dynamic>?)
              ?.map((e) => int.parse(e.toString()))
              .toList() ??
          [];
      List<String> diseases = diseasesjson.map((e) => getdis(e)).toList();
      List<String> medicationjson =
          (response.data["medication"] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [];
      List<String> medication = List<String>.from(medicationjson);

      emit(PatientInfoSuccess(
          age: age,
          height: height,
          wieght: wieght,
          ilness: diseases,
          images: medication));
    } catch (error) {
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(PatientInfofailure(errormessage: failure.errorMessage));
      }
    }
  }

  String getdis(int id) {
    if (id == 1) {
      return "Diabetes";
    } else if (id == 2) {
      return "Heart disease";
    } else if (id == 3) {
      return "Smoking";
    } else if (id == 4) {
      return "Pregnant";
    } else if (id == 5) {
      return "Endocrine diseases";
    } else if (id == 6) {
      return "Drug allergy";
    } else {
      return "Infectious diseases";
    }
  }
}
