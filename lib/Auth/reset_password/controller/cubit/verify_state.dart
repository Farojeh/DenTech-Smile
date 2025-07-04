part of 'verify_cubit.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}
final class VerifyLoading extends VerifyState {}
final class VerifyFailure extends VerifyState {
  final String errorMessage ;
  
  VerifyFailure({required this.errorMessage});
}
final class VerifySuccess extends VerifyState {}
final class ResendSuccess extends VerifyState {}

