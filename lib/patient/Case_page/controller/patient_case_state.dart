part of 'patient_case_cubit.dart';

@immutable
sealed class PatientCaseState {}

final class PatientCaseInitial extends PatientCaseState {}

final class PatientCaseLoading extends PatientCaseState {}

final class PatientCaseFailure extends PatientCaseState {
  final String errorMessage;

  PatientCaseFailure({required this.errorMessage});
}

final class PatientCaseSuccess extends PatientCaseState {
}

final class PatientArchiveSuccess extends PatientCaseState {
  final ArchiveModel archiveModel;
  PatientArchiveSuccess(this.archiveModel);
}

final class PatientCaseInfoSuccess extends PatientCaseState {
  final CaseInfoModel caseInfoModel;
  PatientCaseInfoSuccess(this.caseInfoModel);
}

