part of 'page_cubit.dart';

@immutable
sealed class PageState {}

final class PageInitial extends PageState {}

final class PageLoading extends PageState {}

final class PageFailure extends PageState {
  final String errorMessage;

  PageFailure({required this.errorMessage});
}

final class PageSuccess extends PageState {}
