part of 'case_cubit.dart';

@immutable
sealed class CaseState {}

final class CaseInitial extends CaseState {}

final class CaseLoading extends CaseState {}

final class CaseFailure extends CaseState {
  final String errorMessage;

  CaseFailure({required this.errorMessage});
}

final class CaseSuccess extends CaseState {}
