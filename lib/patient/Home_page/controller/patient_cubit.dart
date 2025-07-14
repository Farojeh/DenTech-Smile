import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/patient/Home_page/model/oral_doctor_model.dart';
import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());
  // PatientCubit() : super(PatientSuccess());

  int appointmentStateNumb = 0;
  String statusMessage = "";

  RequestStatusModel? requestStatusModel;
  Future<void> getAppointmentstatus() async {
    emit(PatientLoading());
    var response = await ApiService.get(endPoint: 'api/requestStatus');
    if (response['success']) {
      appointmentStateNumb = response['data']['id'];
      statusMessage = response['data']['status'];
      requestStatusModel = RequestStatusModel.fromJson(response['data']);
      emit(PatientDoctorStageSuccess(requestStatusModel!));
    }
  }

  OralDoctorModel? oralDoctorModel;
  Future<void> getOralDoctor() async {
    emit(PatientLoading());
    var response = await ApiService.get(endPoint: 'api/oral-medicine-dentist');
    if (response['success']) {
      oralDoctorModel = OralDoctorModel.fromJson(response['data']);
      emit(PatientOralSuccess(oralDoctorModel!));
    }
  }
}
