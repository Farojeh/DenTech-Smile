part of 'state_general_cubit.dart';

@immutable
sealed class StateGeneralState {}

final class StateGeneralInitial extends StateGeneralState {}
final class StateGeneralloading extends StateGeneralState {}
final class StateGeneralfailure extends StateGeneralState {
  final String errormessage ;

  StateGeneralfailure({required this.errormessage});
}
final class StateGeneralsuccess extends StateGeneralState {
  final String? previousdescription;
  final String? supervisorcomments;
  final String appointmentid ;
  final String xrayimage;
  final int patientid ;
  final List<String> befor;
  final List<String> after;

  StateGeneralsuccess({required this.previousdescription,required this.supervisorcomments, required this.appointmentid, required this.xrayimage, required this.patientid, required this.befor, required this.after});
}

