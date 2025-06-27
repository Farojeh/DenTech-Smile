part of 'data_patient_config_cubit.dart';

@immutable
sealed class DataPatientConfigState {}

final class DataPatientConfigInitial extends DataPatientConfigState {}
final class DataPatientConfigLoading extends DataPatientConfigState {}
final class DataPatientConfigFailure extends DataPatientConfigState {
  final String errorMessage ;
  
  DataPatientConfigFailure({required this.errorMessage});
}
final class DataPatientSuccess extends DataPatientConfigState {}
