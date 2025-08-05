part of 'patient_info_cubit.dart';

@immutable
sealed class PatientInfoState {}

final class PatientInfoInitial extends PatientInfoState {}
final class PatientInfoLoading extends PatientInfoState {}
final class PatientInfofailure extends PatientInfoState {
  final String errormessage ;

  PatientInfofailure({required this.errormessage});
}
final class PatientInfoSuccess extends PatientInfoState {
  final String age ;
  final String height ;
  final String wieght ;
  final List<String> ilness ;
  final List<String> images ;

  PatientInfoSuccess({required this.age, required this.height, required this.wieght, required this.ilness, required this.images});
}
