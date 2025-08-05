part of 'state_page_cubit.dart';

@immutable
sealed class StatePageState {}

final class StatePageInitial extends StatePageState {}

final class StatePageloading extends StatePageState {}

final class StatePagefailure extends StatePageState {
  final String errormessage;

  StatePagefailure({required this.errormessage});
}

final class StatePagesuccess extends StatePageState {
  final String? previousdescription;
  final String appointmentid ;
  final String xrayimage;
  final int patientid ;
  final List<String> befor;
  final List<String> after;

  StatePagesuccess(
      {required this.previousdescription,
      required this .patientid ,
      required this.appointmentid,
      required this.xrayimage,
      required this.befor,
      required this.after});
}
