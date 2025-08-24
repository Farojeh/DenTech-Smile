part of 'student_marks_cubit.dart';

@immutable
sealed class StudentMarksState {}

final class StudentMarksInitial extends StudentMarksState {}
final class StudentMarksLoading extends StudentMarksState {}
final class StudentMarksFailure extends StudentMarksState {
  final String errormessage ;

  StudentMarksFailure({required this.errormessage});
}
final class StudentMarksSuccess extends StudentMarksState {
  final String path ;

  StudentMarksSuccess({required this.path});
}
