import 'package:dentech_smile/core/utils/api.dart';
import 'package:dentech_smile/core/utils/theme_cubit.dart';
import 'package:dentech_smile/patient/Archive_page/model/ArchiveModel.dart';
import 'package:dentech_smile/patient/Case_page/model/case_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_case_state.dart';

class PatientCaseCubit extends Cubit<PatientCaseState> {
  PatientCaseCubit() : super(PatientCaseInitial());
  // PatientCaseCubit() : super(PatientCaseSuccess());
  List<Map<String, dynamic>> patientCases = [
    {
      "id": 2,
      "doctor_name": "احمد",
      "year": "سنة رابعة",
      "stage_name": "قلع ناب",
      "image": "assets/images/doctor.png",
      "rate": 3.2,
      "date": "12/3/2025",
    },
    {
      "id": 3,
      "doctor_name": "محمد",
      "year": "سنة خامسة",
      "stage_name": "كاملة",
      "image": "assets/images/doctor.png",
      "rate": 5.0,
      "date": "12/5/2025",
    },
  ];

  List<Map<String, dynamic>> casesInfo = [
    {
      "id": 2,
      "description":
          "حالة قلع سن ناب حيث جاء المريض بتسوس حاد يصل الى العظم وكان الحل الافضل قلع سن الناب مع مخدر لم يحدث اي مضاعفات مفاجئة وسار العمل بشكل جيد على مدى 3 جلسات",
      "appointments": [
        {"isDone": true, "date": "12/12/2012", "time": "9 AM"},
        {"isDone": false, "date": "12/10/2012", "time": "10 AM"},
        {"isDone": true, "date": "12/11/2012", "time": "11 AM"},
      ],
      "xray_image": "assets/images/XRay.png",
    },
    {
      "id": 3,
      "description":
          "حالة قلع سن ناب حيث جاء المريض بتسوس حاد يصل الى العظم وكان الحل الافضل قلع سن الناب مع مخدر لم يحدث اي مضاعفات مفاجئة وسار العمل بشكل جيد على مدى 2 جلسات",
      "appointments": [
        {"isDone": true, "date": "12/12/2012", "time": "9 AM"},
        {"isDone": false, "date": "12/10/2012", "time": "10 AM"},
        {"isDone": true, "date": "12/11/2012", "time": "11 AM"},
      ],
      "xray_image": "assets/images/XRay.png",
    },
  ];

  Map<String, Map<String, dynamic>> caseInfo = {};

  ArchiveModel? archiveModel;
  Future<void> getCases(BuildContext context) async {
    emit(PatientCaseLoading());
      final isArabic = context.read<ThemeCubit>().isArabic;
    final langCode = isArabic ? "ar" : "en";
    var response = await ApiService.get(
      endPoint: 'api/viewArchive',
       langCode: langCode,
       withLang: true,
      );
    if (response['success']) {
      archiveModel = ArchiveModel.fromJson(response['data']);
      emit(PatientArchiveSuccess(archiveModel!));
    }
  }

  CaseInfoModel? caseInfoModel;
  Future<void> getCaseInfoByIdStudentStage(int idStu, int idSta,BuildContext context) async {
    emit(PatientCaseSuccess());
      final isArabic = context.read<ThemeCubit>().isArabic;
    final langCode = isArabic ? "ar" : "en";
    var response = await ApiService.post(
      endPoint: 'api/viewTreatment',
      data: {"student_id": idStu, "stage_id": idSta},
       langCode: langCode,
       withLang: true,
    );
    print("kjhg");
    print({"student_id": idStu, "stage_id": idSta});
    if (response['success']) {
      caseInfoModel = CaseInfoModel.fromJson(response['data']);
      print(response);
      emit(PatientCaseInfoSuccess(caseInfoModel!));
    }
  }
}
