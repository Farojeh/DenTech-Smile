part of 'archive_cubit.dart';

@immutable
sealed class ArchiveState {}

final class ArchiveInitial extends ArchiveState {}
final class ArchiveSuccess extends ArchiveState {
  final List<Internship> allinternships ;
  final List<Archive> allarchives ;
  final int select ;

  ArchiveSuccess({required this.allarchives,required this.select, required this.allinternships});
}
