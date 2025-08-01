part of 'my_resource_dialog_cubit.dart';

@immutable
sealed class MyResourceDialogState {}

final class MyResourceDialogInitial extends MyResourceDialogState {}
final class MyResourceDialogLoading extends MyResourceDialogState {}
final class MyResourceDialogfailure extends MyResourceDialogState {
  final String errormessage ;

  MyResourceDialogfailure({required this.errormessage});
}
final class MyResourceDialogSuccess extends MyResourceDialogState {}
