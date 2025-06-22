part of 'number_cubit.dart';

@immutable
sealed class NumberState {}

final class NumberInitial extends NumberState {}
final class NumberLoading extends NumberState {}
final class NumberFailure extends NumberState {
  final String errorMessage ;
  
  NumberFailure({required this.errorMessage});
}
final class NumberSuccess extends NumberState {}
