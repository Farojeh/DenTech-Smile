part of 'my_resources_cubit.dart';

@immutable
sealed class MyResourcesState {}

final class MyResourcesInitial extends MyResourcesState {}
final class MyResourcesLoading extends MyResourcesState {}
final class MyResourcesfailure extends MyResourcesState {
  final String errormessage;

  MyResourcesfailure({required this.errormessage});
}
final class MyResourcesSuccess extends MyResourcesState {
  final List<Resource> resources ;

  MyResourcesSuccess({required this.resources});
}
