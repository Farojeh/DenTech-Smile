part of 'my_exchanges_cubit.dart';

@immutable
sealed class MyExchangesState {}

final class MyExchangesInitial extends MyExchangesState {}
final class MyExchangesLoading extends MyExchangesState {}
final class MyExchangesSuccess extends MyExchangesState {
  final List<Resource> resources;

  MyExchangesSuccess({required this.resources});
}
final class MyExchangesfailure extends MyExchangesState {
  final String errormessage;

  MyExchangesfailure({required this.errormessage});
}
