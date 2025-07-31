part of 'artical_cubit.dart';

@immutable
sealed class ArticalState {}

final class ArticalInitial extends ArticalState {}
final class ArticalSuccess  extends ArticalState {
  final String image ;
  final String title ;
  final String author ;
  final String time ;
  final bool isimage ;
  final String artical ;

  ArticalSuccess({required this.isimage,required this.image, required this.title, required this.author, required this.time, required this.artical});
}
final class ArticalLoading extends ArticalState {}
final class ArticalFailure extends ArticalState {
  final String errormessage;

  ArticalFailure({required this.errormessage});
}
