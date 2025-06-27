part of 'information_cubit.dart';

@immutable
sealed class InformationState {}

final class InformationInitial extends InformationState {}

final class InformationDate extends InformationState {
  final String date;

  InformationDate({required this.date});
}
