import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dentech_smile/Auth/data_patient/model/illness.dart';
import 'package:dentech_smile/core/errors/failures.dart';
import 'package:dentech_smile/core/utils/api_service.dart';
import 'package:dentech_smile/core/utils/service_locator.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'data_patient_config_state.dart';

class DataPatientConfigCubit extends Cubit<DataPatientConfigState> {
  DataPatientConfigCubit() : super(DataPatientConfigInitial());

  final apiService = getIt<ApiService>();

  Future<void> configData(
      {required List<Illness> illness,
      required List<File> images,
      required String date,
      required String hieght,
      required String wieght}) async {
        print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    emit(DataPatientConfigLoading());

    FormData formData = FormData();
    formData.fields.addAll([
      MapEntry('height', hieght),
      MapEntry('weight', wieght),
      MapEntry('birthdate', date),
    ]);
     print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

    for (int i = 0; i < illness.length; i++) {
      formData.fields.add(MapEntry('disease_id[]', illness[i].id.toString()));
    }
    print("llllllllllllllllllllllllllllllllll");

    for (int i = 0; i < images.length; i++) {
      formData.files.add(
        MapEntry(
          'image[]',
          await MultipartFile.fromFile(
            images[i].path,
            filename: images[i].path.split('/').last,
          ),
        ),
      );
    }
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print(userInfo!.getString(Static.token)!);
    Response response;
    try {
      response = await apiService.postfiles(
          endPoint: "/information", data: formData, tokenbool: true);
          print(userInfo!.getString(Static.token)!);
          print(response);
      if (response.statusCode != 200 && response.statusCode != 201) {
        var failure =
            ServerFaliure.fromResponse(response.statusCode!, response.data);
        emit(DataPatientConfigFailure(errorMessage: failure.errorMessage));
      } else {
        emit(DataPatientSuccess());
      }
    } catch (error) {
      print("nnnnnnnnnnnnnnnnnnnnnnnnnnn**");
      if (error is DioException) {
        var failure = ServerFaliure.fromDioException(error);
        emit(DataPatientConfigFailure(errorMessage: failure.errorMessage));
      }
    }
  }
}
