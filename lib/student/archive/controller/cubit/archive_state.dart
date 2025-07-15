part of 'archive_cubit.dart';

@immutable
sealed class ArchiveState {}

final class ArchiveInitial extends ArchiveState {}
final class ArchiveSuccess extends ArchiveState {
  final List<Archive> archiveList ;

  ArchiveSuccess({required this.archiveList});
}
