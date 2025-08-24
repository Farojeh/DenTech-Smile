part of 'professor_home_cubit.dart';

@immutable
sealed class ProfessorHomeState {}

final class ProfessorHomeInitial extends ProfessorHomeState {}

final class ProfessorHomeLoading extends ProfessorHomeState {}

final class ProfessorSchaduleLoading extends ProfessorHomeState {}

final class ProfessorPracticalLoading extends ProfessorHomeState {}

final class ProfessorRecordLoading extends ProfessorHomeState {}

final class ProfessorHomeFailure extends ProfessorHomeState {
  final String errorMessage;

  ProfessorHomeFailure({required this.errorMessage});
}

final class ProfessorHomeSuccess extends ProfessorHomeState {}
