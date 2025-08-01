part of 'exchange_dialog_cubit.dart';

@immutable
sealed class ExchangeDialogState {}

final class ExchangeDialogInitial extends ExchangeDialogState {}
final class ExchangeDialogLoading extends ExchangeDialogState {}
final class ExchangeDialogfailure extends ExchangeDialogState {
  final String errormessage;

  ExchangeDialogfailure({required this.errormessage});
}
final class ExchangeDialogSuccess extends ExchangeDialogState {
  final Resource resource;
  final String number ;
  final String name ;

  ExchangeDialogSuccess({required this.name,required this.resource, required this.number});
}
