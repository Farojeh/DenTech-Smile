import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/professor/Archive_professor_page/model/doctor_archive_model.dart';
import 'package:dentech_smile/professor/Case_doctor_page/model/case_doctor_model.dart';
import 'package:dentech_smile/professor/Case_professor_page/model/case_prof_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'case_state.dart';

class CaseCubit extends Cubit<CaseState> {
  CaseCubit() : super(CaseInitial());
  int score = 0;
  String comment = '';
  bool isArchived = false;
  int archive = 0;
  String message = '';

  void changeCheckedArchive(bool value) {
    isArchived = value;
    if (isArchived) {
      archive = 1;
    } else {
      archive = 0;
    }
    emit(CaseSuccess());
  }

  CaseProfModel? caseProfModel;
  Future<void> getProfCase(int studentId, int sessionId) async {
    emit(CaseLoading());
    try {
      var response = await ApiService.post(
        endPoint: 'api/supervisor-scan-Qrcode',
        data: FormData.fromMap({
          'student_id': studentId,
          'session_id': sessionId,
        }),
      );
      if (response['success']) {
        caseProfModel = CaseProfModel.fromJson(response['data']);
        emit(CaseSuccess());
      }
    } catch (e) {
      emit(CaseFailure(errorMessage: e.toString()));
    }
  }

  Future<void> postEvaluate(int sessionId) async {
    emit(CaseLoading());
    try {
      var response = await ApiService.post(
        endPoint: 'api/evaluate-session',
        data: FormData.fromMap({
          'session_id': sessionId,
          'evaluation_score': score,
          'supervisor_comments': comment,
          'is_archived': archive,
        }),
      );
      if (response['success']) {
        emit(CaseSuccess());
        message = 'Done';
      }
    } catch (e) {
      emit(CaseFailure(errorMessage: e.toString()));
    }
  }

  List<DoctorArchiveModel>? doctorArchiveModelList;
  Future<void> getDoctorArchive(int studentId, int sessionId) async {
    emit(CaseLoading());
    try {
      var response = await ApiService.post(
        endPoint: 'api/supervisor-scan-Qrcode',
        data: FormData.fromMap({
          'student_id': studentId,
          'session_id': sessionId,
        }),
      );
      if (response['success']) {
        List<dynamic> ll = [];
        ll = response['data']
            .map(
              (doctorArchiveModel) =>
                  DoctorArchiveModel.fromJson(doctorArchiveModel),
            )
            .toList();

        doctorArchiveModelList = ll.cast<DoctorArchiveModel>();

        emit(CaseSuccess());
      }
    } catch (e) {
      emit(CaseFailure(errorMessage: e.toString()));
    }
  }

  CaseDoctorModel? caseDoctorModel;
  Future<void> getDoctorCase(int sessionId) async {
    emit(CaseLoading());
    try {
      var response = await ApiService.get(
        endPoint: 'api/doctorViewCase/$sessionId',
      );
      if (response['success']) {
        caseDoctorModel = CaseDoctorModel.fromJson(response['data']);
        emit(CaseSuccess());
      }
    } catch (e) {
      emit(CaseFailure(errorMessage: e.toString()));
    }
  }
}
