part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {
  final int select;
  HomeInitial({this.select = 0});
  
  HomeInitial copyWith({int? select}) {
    return HomeInitial(
      select: select ?? this.select,
    );
  }
}
