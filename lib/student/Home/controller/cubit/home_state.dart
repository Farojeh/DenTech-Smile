part of 'home_cubit.dart';

@immutable
 class HomeState {
  final int select;
  final int type ;
  const HomeState({this.select = 0 , this.type=0});
  
  HomeState copyWith({int? select , int? type}) {
    return HomeState(
      select: select ?? this.select,
      type: type??this.type
    );
  }}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errormessage;

  const HomeFailure({super.select,required this.errormessage});
}
final class HomeSuccess extends HomeState {
  final List<Day> days;
  final List<Day> practical ;

  const HomeSuccess({super.select,super.type ,required this.days , required this.practical});
}
