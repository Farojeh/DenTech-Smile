part of 'learning_cubit.dart';

@immutable
sealed class LearningState {}

final class LearningInitial extends LearningState {}
final class LearningSuccess extends LearningState {
  final List<Internship> allinternships ;
  final List<Archive> allarchives ;
  final int select ;

  LearningSuccess({required this.allarchives,required this.select, required this.allinternships});
}
