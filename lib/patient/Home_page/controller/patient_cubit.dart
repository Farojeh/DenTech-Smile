import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Appointments_page/model/appointment_model.dart';
import 'package:dentech_smile/patient/Home_page/model/oral_doctor_model.dart';
import 'package:dentech_smile/patient/Home_page/model/request_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dentech_smile/main.dart';
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
  Future<void> getOralDoctor(bool isArabic) async {
    print("kkkkk");
    print(userInfo!.getString(Static.token));
    // final isArabic = context.read<ThemeCubit>().isArabic;
    final langCode = isArabic ? "ar" : "en";
    emit(PatientLoading());
    var response = await ApiService.get(
      endPoint: 'api/oral-medicine-dentist',
      langCode: langCode,
      withLang: true,
    );
    print(response['data']);
    if (response['success']) {
      oralDoctorModel = OralDoctorModel.fromJson(response['data']);
      emit(PatientSuccess());
    }
  }

  AppointmentModel? appointmentModel;
  Future<void> getAppointmentDoctor(
    int idStu,
    int idSta,
    BuildContext context,
  ) async {
    emit(PatientLoading());
    final isArabic = context.read<ThemeCubit>().isArabic;
    final langCode = isArabic ? "ar" : "en";
    var response = await ApiService.post(
      endPoint: 'api/available-appointment',
      data: {"student_id": idStu, "stage_id": idSta},
      langCode: langCode,
      withLang: true,
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
    print(userInfo!.getString(Static.token));
    print(id);
    emit(PatientLoading());
    try{
     var response = await ApiService.post(
      endPoint: 'api/book-appointment',
      data: {"available_id": id.toString()},
    );
    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
    if (response['success']) {
      statusMessage = response['data']['status'];
      emit(PatientSuccess());
    }
    }catch(e){
       print("***************************************88");
       print(e);
    }
  }

  void newEmit() {
    emit(PatientSuccess());
  }
}
