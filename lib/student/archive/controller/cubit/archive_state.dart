part of 'archive_cubit.dart';

@immutable
sealed class ArchiveState {}

final class ArchiveInitial extends ArchiveState {}
final class Archiveloading extends ArchiveState {}
final class Archivefailure extends ArchiveState {
  final String errormessage ;

  Archivefailure({required this.errormessage});
}
final class ArchiveSuccess extends ArchiveState {
  final List<InternshipTwo> allinternships ;
  final List<ArchiveTwo> allarchives ;
  final int select ;

  ArchiveSuccess({required this.allarchives,required this.select, required this.allinternships});
}
