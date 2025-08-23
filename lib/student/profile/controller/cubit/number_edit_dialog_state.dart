part of 'number_edit_dialog_cubit.dart';

@immutable
sealed class NumberEditDialogState {}

final class NumberEditDialogInitial extends NumberEditDialogState {}

final class NumberEditDialogLoading extends NumberEditDialogState {}

final class NumberEditDialogSuccess extends NumberEditDialogState {}

final class NumberEditDialogfailure extends NumberEditDialogState {
  final String errormessage;

  NumberEditDialogfailure({required this.errormessage});
}
