part of 'resource_view_cubit.dart';

@immutable
sealed class ResourceViewState {}

final class ResourceViewInitial extends ResourceViewState {}
final class ResourceViewLoading extends ResourceViewState {}
final class ResourceViewfailure extends ResourceViewState {
  final String errormessage ;

  ResourceViewfailure({required this.errormessage});
}
final class ResourceViewSuccess extends ResourceViewState {
  final List<Resource> resources ;

  ResourceViewSuccess({required this.resources});
}

