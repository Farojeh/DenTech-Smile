part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientFailure extends PatientState {
  final String errorMessage;

  PatientFailure({required this.errorMessage});
}

final class PatientSuccess extends PatientState {}

// final class PatientOralSuccess extends PatientState {
//   final OralDoctorModel? oralDoctorModel;

//   PatientOralSuccess([this.oralDoctorModel]);
// }

final class PatientDoctorStageSuccess extends PatientState {
  final RequestStatusModel? requestStatusModel;

  PatientDoctorStageSuccess({this.requestStatusModel});
}

final class PatientAppointmentSuccess extends PatientState {
  final AppointmentModel? appointmentModel;

  PatientAppointmentSuccess({this.appointmentModel});
}
