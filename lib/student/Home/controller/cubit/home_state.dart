part of 'home_cubit.dart';

@immutable
 class HomeState {
  final int select;
  HomeState({this.select = 0});
  
  HomeState copyWith({int? select}) {
    return HomeState(
      select: select ?? this.select,
    );
  }}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errormessage;

  HomeFailure({super.select, required this.errormessage});
}
final class HomeSuccess extends HomeState {
  final List<Day> days;

  HomeSuccess({super.select, required this.days});
}
