part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeLoading extends ThemeState {}

final class ThemeFailure extends ThemeState {
  final String errorMessage;

  ThemeFailure({required this.errorMessage});
}

final class ThemeSuccess extends ThemeState {

  ThemeSuccess();
}

