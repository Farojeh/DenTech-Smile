part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientFailure extends PatientState {
  final String errorMessage;

  PatientFailure({required this.errorMessage});
}

final class PatientOralSuccess extends PatientState {
  final OralDoctorModel? oralDoctorModel;

  PatientOralSuccess([this.oralDoctorModel]);
}

final class PatientDoctorStageSuccess extends PatientState {
  final RequestStatusModel? requestStatusModel;

  PatientDoctorStageSuccess([this.requestStatusModel]);
}