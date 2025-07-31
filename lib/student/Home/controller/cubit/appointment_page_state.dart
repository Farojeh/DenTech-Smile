part of 'appointment_page_cubit.dart';

@immutable
sealed class AppointmentPageState {}

final class AppointmentPageInitial extends AppointmentPageState {}
final class AppointmentPageLoading extends AppointmentPageState {}
final class AppointmentPageSuccess extends AppointmentPageState {
   final List<AddAppointment> appointments;

  AppointmentPageSuccess({required this.appointments});
}
final class AppointmentPagefailure extends AppointmentPageState {
  final String errormessage;

  AppointmentPagefailure({required this.errormessage});
}

final class Appointmentsubloading extends AppointmentPageSuccess {
  Appointmentsubloading({required super.appointments});
}
final class Appointmentsubfailure extends AppointmentPageSuccess {
  final String errormessage;
  Appointmentsubfailure({required super.appointments , required this.errormessage});
}

