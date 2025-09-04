part of 'attendence_report_cubit.dart';

@immutable
sealed class AttendenceReportState {}

final class AttendenceReportInitial extends AttendenceReportState {}
final class AttendenceReportLoading extends AttendenceReportState {}
final class AttendenceReportFailure extends AttendenceReportState {
  final String errormessage;

  AttendenceReportFailure({required this.errormessage});
}
final class AttendenceReportSuccess extends AttendenceReportState {
  final String path ;

  AttendenceReportSuccess({required this.path});
}
