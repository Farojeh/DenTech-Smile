part of 'appointment_page_cubit.dart';

@immutable
sealed class AppointmentPageState {}

final class AppointmentPageInitial extends AppointmentPageState {}
final class AppointmentPageSuccess extends AppointmentPageState {
   final List<AddAppointment> appointments;

  AppointmentPageSuccess({required this.appointments});
}
