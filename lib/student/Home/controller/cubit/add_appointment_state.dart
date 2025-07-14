part of 'add_appointment_cubit.dart';

@immutable
class AddAppointmentState {
  final String date;
  final String time;
  final String am;
  const AddAppointmentState(
      {this.date = "dd/mm/yyyy", this.time = "00:00", this.am = "AM"});

  AddAppointmentState copyWith({String? date, String? time, String? am}) {
    return AddAppointmentState(
      date: date ?? this.date,
      time: time ?? this.time,
      am: am ?? this.am,
    );
  }
}

final class AddAppointmentInitial extends AddAppointmentState {}
final class AddAppointmentfailure extends AddAppointmentState {
  final String errormessage ;

 const AddAppointmentfailure({super.date, super.time, super.am, required this.errormessage});
}
final class AddAppointmentSuccess extends AddAppointmentState {}

