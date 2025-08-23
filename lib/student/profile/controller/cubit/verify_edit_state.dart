part of 'verify_edit_cubit.dart';

@immutable
sealed class VerifyEditState {}

final class VerifyEditInitial extends VerifyEditState {}
final class VerifyEditLoading extends VerifyEditState {}
final class VerifyEditSuccess extends VerifyEditState {}
final class VerifyEditFailure extends VerifyEditState {
  final String errormessage ;

  VerifyEditFailure({required this.errormessage});
}
