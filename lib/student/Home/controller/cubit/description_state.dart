part of 'description_cubit.dart';

@immutable
sealed class DescriptionState {}

final class DescriptionInitial extends DescriptionState {
  final String des ;

  DescriptionInitial({required this.des});
}
final class DescriptionLoading extends DescriptionState {}
final class Descriptionfailure extends DescriptionState {
  final String errormessage;

  Descriptionfailure({required this.errormessage});  
}
final class Descriptionsuccess extends DescriptionState {
  final String des ;

  Descriptionsuccess({required this.des});
}
