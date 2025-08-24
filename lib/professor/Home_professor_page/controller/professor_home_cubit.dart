// import 'dart:convert';

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/professor/Attendance_Registration_professor_page/model/practical-schedule-students_model.dart';
import 'package:dentech_smile/professor/Home_professor_page/model/schedule_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

part 'professor_home_state.dart';

class ProfessorHomeCubit extends Cubit<ProfessorHomeState> {
  ProfessorHomeCubit() : super(ProfessorHomeInitial());

  int daysSelectedIndex = 1;
  // Barcode? result;
  // QRViewController? controller;
  Map<String, dynamic> qrResult = {};
  String studentid = "";
  String sessionid = "";
  ScheduleModel? scheduleModel;
  List<StudentsPractical> students = [];
  int length = 0;
  late List<bool> checkedList;
  List<int> idsList = [];
  String messaage = '';

  List<List<Schedules>> daysSchedules = [];

  void changeSelectedIndex(int index) {
    daysSelectedIndex = index;
    if (!isClosed) {
      emit(ProfessorHomeSuccess());
    }
  }

  void addToIdList(int id) {
    idsList.add(id);

    if (!isClosed) {
      emit(ProfessorHomeSuccess());
    }
  }

  void getDaysSchedules() {
    for (var i = 0; i <= 4; i++) {
      daysSchedules.add(scheduleModel!.weeklySchedule![i].schedules ?? []);
    }
  }

  void changeChecked(int index, bool value) {
    checkedList[index] = value;
    if (!isClosed) {
      emit(ProfessorHomeSuccess());
    }
  }

  // void getResult(Barcode scanResult) {
  //   result = scanResult;
  //   if (!isClosed) {
  //     emit(ProfessorHomeSuccess());
  //   }
  // }

  // void onQRViewCreated(QRViewController qrController, BuildContext context) {
  //   controller = qrController;

  //   controller?.scannedDataStream.listen((scanData) async {
  //     result = scanData;

  //     if (!isClosed) {
  //       emit(ProfessorHomeSuccess());
  //     }

  //     if (result != null) {
  //       try {
  //         qrResult = jsonDecode(result?.code ?? "{}");
  //       } catch (e) {
  //         qrResult = {};
  //       }

  //       controller?.dispose();

  //       if (context.mounted) {
  //         Navigator.of(context).pop();
  //       }
  //     }
  //   });
  // }

  Future<void> getWeeklySchedule() async {
    if (isClosed) return;

    emit(ProfessorSchaduleLoading());

    try {
      var response = await ApiService.get(
        endPoint: 'api/supervisor-weekly-schedule',
      );

      if (isClosed) return;

      if (response['success']) {
        scheduleModel = ScheduleModel.fromJson(response['data']);
        getDaysSchedules();
        if (!isClosed) {
          emit(ProfessorHomeSuccess());
          messaage = 'Done';
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(ProfessorHomeFailure(errorMessage: e.toString()));
      }
    }
  }

  PracticalModel? practicalModel;
  Future<void> getPracticalScheduleStudents(int practicalScheduleId) async {
    if (isClosed) return;

    emit(ProfessorPracticalLoading());

    try {
      var response = await ApiService.post(
        endPoint: 'api/practical-schedule-students',
        data: FormData.fromMap({"practicalSchedule_Id": practicalScheduleId}),
      );

      if (isClosed) return;

      if (response['success']) {
        practicalModel = PracticalModel.fromJson(response['data']);
        length = practicalModel!.students!.length;
        checkedList = List.generate(length, (index) => false);
        if (!isClosed) {
          emit(ProfessorHomeSuccess());
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(ProfessorHomeFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<void> postRecordAbsences(int practicalScheduleId) async {
    // if (isClosed) return;

    emit(ProfessorRecordLoading());

    // try {
    print("hshshshshs");
    print(idsList);

    var response = await ApiService.post(
      endPoint: 'api/record-Absences',
      data: {
        "practicalSchedule_Id": practicalScheduleId,
        "absent_students": idsList,
      },
    );
    print(response);

    // if (isClosed) return;

    if (response['success']) {
      if (!isClosed) {
        emit(ProfessorHomeSuccess());
        messaage = "Done";
      }
    }
    // }
    // catch (e) {
    //   if (!isClosed) {
    //     emit(ProfessorHomeFailure(errorMessage: e.toString()));
    //   }
    // }
  }

  bool scanData(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final String? rawValue = barcode.rawValue;
      if (rawValue == null) continue;
      try {
        final object = jsonDecode(rawValue);
        studentid = object["student_id"].toString();
        sessionid = object["session_id"].toString();
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  void printscan(){
    print("*****************************************session_id $sessionid **********************************");
    print("*****************************************student_id $studentid **********************************");
  }

  @override
  Future<void> close() {
    // ignore: deprecated_member_use
    // controller?.dispose();
    return super.close();
  }
}
