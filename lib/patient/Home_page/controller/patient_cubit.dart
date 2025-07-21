import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/patient/Appointments_page/model/appointment_model.dart';
import 'package:dentech_smile/patient/Home_page/model/oral_doctor_model.dart';
import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

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

      emit(
        PatientDoctorStageSuccess(
          requestStatusModel: RequestStatusModel.fromJson(response['data']),
        ),
      );
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

  AppointmentModel? appointmentModel;
  Future<void> getAppointmentDoctor(int idStu, int idSta) async {
    print(idStu + idSta);
    emit(PatientLoading());
    var response = await ApiService.post(
      endPoint: 'api/available-appointment',
      data: {"student_id": idStu, "stage_id": idSta},
    );
    if (response['success']) {
      appointmentModel = AppointmentModel.fromJson(response['data']);
      emit(
        PatientAppointmentSuccess(
          appointmentModel: AppointmentModel.fromJson(response['data']),
        ),
      );
    }
  }

  Future<void> postAppointment(int id) async {
    emit(PatientLoading());
    var response = await ApiService.post(
      endPoint: 'api/book-appointment',
      data: {"available_id": id},
    );
    if (response['success']) {
      statusMessage = response['data']['status'];
      print(statusMessage.toString());
      emit(PatientSuccess());
    }
  }
}
